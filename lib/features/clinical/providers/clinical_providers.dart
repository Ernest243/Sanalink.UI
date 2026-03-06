import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/auth/auth_service.dart';
import 'package:sanalink/features/clinical/data/clinical_repository.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/models/note_model.dart';
import 'package:sanalink/services/patient_resolver_service.dart';

part 'clinical_providers.g.dart';

@riverpod
class TriageList extends _$TriageList {
  @override
  FutureOr<List<EncounterModel>> build() async {
    final repository = ref.watch(clinicalRepositoryProvider);
    final encounters = await repository.getEncounters(status: 'Open');

    // les noms des patients
    final resolver = ref.read(patientResolverServiceProvider.notifier);
    final resolvedList = <EncounterModel>[];

    for (var enc in encounters) {
      final name = await resolver.resolvePatientName(enc.patientId);
      resolvedList.add(enc.copyWith(patientName: name));
    }

    return resolvedList;
  }

  Future<void> submitVitals(int id, Map<String, dynamic> vitals) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(clinicalRepositoryProvider);
      final nurseId =
          ref.read(authServiceProvider).value?.user?.id;
      await repository.updateVitals(id, vitals, nurseId: nurseId);
      await repository.updateStatus(id, 'InProgress');
      return build();
    });
  }
}

@riverpod
class ConsultationList extends _$ConsultationList {
  @override
  FutureOr<List<EncounterModel>> build() async {
    final repository = ref.watch(clinicalRepositoryProvider);
    final encounters = await repository.getEncounters(status: 'InProgress');

    final resolver = ref.read(patientResolverServiceProvider.notifier);
    final resolvedList = <EncounterModel>[];

    for (var enc in encounters) {
      final name = await resolver.resolvePatientName(enc.patientId);
      resolvedList.add(enc.copyWith(patientName: name));
    }

    return resolvedList;
  }

  /// Clôture une consultation en sauvegardant le diagnostic final et en changeant le statut
  Future<void> closeConsultation(int id, String diagnosis, String notes) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(clinicalRepositoryProvider);
      // sauvegarde les informations cliniques avant de fermer
      await repository.saveConsultation(id, diagnosis, notes);
      // Transition vers le statut "Closed"
      await repository.updateStatus(id, 'Closed');
      // Rafraîchissement de la liste locale
      return build();
    });
  }

  /// Ajoute une note clinique pendant ou en dehors d'une consultation
  Future<void> addNote(int patientId, String content) async {
    await ref.read(clinicalRepositoryProvider).addNote(patientId, content);
    // Rafraîchit la liste des notes pour que la nouvelle apparaisse immédiatement
    ref.invalidate(patientNotesProvider(patientId));
  }
}

// Provider manuel pour l'historique patient pour éviter d'attendre la génération
final patientHistoryProvider = FutureProvider.family<List<EncounterModel>, int>(
  (ref, patientId) async {
    final repository = ref.watch(clinicalRepositoryProvider);
    final encounters = await repository.getEncounters();
    return encounters.where((e) => e.patientId == patientId).toList();
  },
);

// Provider pour les notes cliniques d'un patient
final patientNotesProvider = FutureProvider.family<List<NoteModel>, int>(
  (ref, patientId) async {
    final repository = ref.watch(clinicalRepositoryProvider);
    return repository.getPatientNotes(patientId);
  },
);
