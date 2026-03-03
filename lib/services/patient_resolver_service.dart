import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/models/patient_model.dart';
import 'package:sanalink/core/demo/demo_mode.dart';
import 'package:sanalink/core/demo/demo_store.dart';
import 'dart:collection';

part 'patient_resolver_service.g.dart';

@Riverpod(keepAlive: true)
class PatientResolverService extends _$PatientResolverService {
  final Map<int, PatientModel> _cache = HashMap();

  @override
  void build() {
    // Initialisation
  }
  /// le nom complet d'un patient à partir de son ID.
  /// En mode Démo, utilise le [DemoStore].
  Future<String> resolvePatientName(int patientId) async {
    if (_cache.containsKey(patientId)) {
      return _cache[patientId]!.fullName;
    }

    try {
      if (isDemoMode) {
        await Future.delayed(const Duration(milliseconds: 100));
        final patient = DemoStore.instance.patients.firstWhere(
          (p) => p.id == patientId,
          orElse: () => PatientModel(
            id: patientId,
            firstName: 'Patient',
            lastName: '$patientId',
            fullName: 'Patient $patientId',
            dateOfBirth: DateTime(1980, 1, 1),
            gender: 'U',
            facilityId: 1,
            createdAt: DateTime.now(),
          ),
        );
        _cache[patientId] = patient;
        return patient.fullName;
      }

      await Future.delayed(const Duration(milliseconds: 500));
      return 'Patient Inconnu ($patientId)';
    } catch (e) {
      return 'Patient Inconnu ($patientId)';
    }
  }

  /// Récupère le modèle complet du patient.
  Future<PatientModel?> getPatient(int patientId) async {
    if (isDemoMode) {
      return DemoStore.instance.patients.firstWhere((p) => p.id == patientId);
    }
    return null;
  }
}
