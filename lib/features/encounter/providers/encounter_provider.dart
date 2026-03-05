import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/features/encounter/data/encounter_repository.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/services/patient_resolver_service.dart';

part 'encounter_provider.g.dart';

@riverpod
class EncounterNotifier extends _$EncounterNotifier {
  @override
  Future<List<EncounterModel>> build() async {
    return _fetchAndResolveEncounters();
  }

  /// Jointure entre les données cliniques et l'identité des patients.
  Future<List<EncounterModel>> _fetchAndResolveEncounters() async {
    final repository = ref.read(encounterRepositoryProvider);
    final resolver = ref.read(patientResolverServiceProvider.notifier);

    // 1. Récupération des données cliniques depuis l'API
    final rawEncounters = await repository.getEncounters();

    // 2. Résolution des noms de patients uniquement si manquants
    final resolvedEncounters = await Future.wait(
      rawEncounters.map((enc) async {
        if (enc.patientName.isNotEmpty) return enc;
        final String fullName =
            await resolver.resolvePatientName(enc.patientId);
        return enc.copyWith(patientName: fullName);
      }),
    );

    return resolvedEncounters;
  }

  /// Crée une nouvelle consultation.
  Future<void> createEncounter(
    int patientId,
    String chiefComplaint, {
    String? vitals,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(encounterRepositoryProvider)
          .createEncounter(patientId, chiefComplaint, vitals: vitals);
      return _fetchAndResolveEncounters();
    });
  }

  /// Met à jour le statut d'une consultation.
  Future<void> updateStatus(int encounterId, String newStatus) async {
    final repository = ref.read(encounterRepositoryProvider);


    final previousState = state;
    if (state.value != null) {
      state = AsyncData(
        state.value!.map((e) {
          if (e.id == encounterId) return e.copyWith(status: newStatus);
          return e;
        }).toList(),
      );
    }

    try {
      await repository.updateStatus(encounterId, newStatus);
      // Réussite de l'API
    } catch (e) {
      // Annulation en cas d'erreur de réseau
      state = previousState;
      rethrow;
    }
  }
}
