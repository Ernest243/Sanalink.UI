import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/models/patient_model.dart';
import 'package:sanalink/core/demo/demo_mode.dart';
import 'package:sanalink/core/demo/demo_store.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'dart:collection';

part 'patient_resolver_service.g.dart';

@Riverpod(keepAlive: true)
class PatientResolverService extends _$PatientResolverService {
  final Map<int, PatientModel> _cache = HashMap();

  @override
  void build() {
    // Initialisation
  }

  /// Récupère le modèle complet du patient (avec cache).
  Future<PatientModel?> getPatient(int patientId) async {
    if (_cache.containsKey(patientId)) return _cache[patientId];

    if (isDemoMode) {
      try {
        final patient = DemoStore.instance.patients
            .firstWhere((p) => p.id == patientId);
        _cache[patientId] = patient;
        return patient;
      } catch (_) {
        return null;
      }
    }

    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get('Patient/$patientId');
      final patient = PatientModel.fromJson(response.data);
      _cache[patientId] = patient;
      return patient;
    } catch (_) {
      return null;
    }
  }

  /// Retourne le nom complet d'un patient à partir de son ID.
  Future<String> resolvePatientName(int patientId) async {
    final patient = await getPatient(patientId);
    return patient?.fullName ?? 'Patient Inconnu ($patientId)';
  }
}
