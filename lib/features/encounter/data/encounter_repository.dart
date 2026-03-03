import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/models/encounter_update_request.dart';

part 'encounter_repository.g.dart';

@riverpod
EncounterRepository encounterRepository(Ref ref) {
  return EncounterRepository(ref);
}

class EncounterRepository {
  final Ref ref;

  EncounterRepository(this.ref);

  Future<List<EncounterModel>> getEncounters() async {
    final dio = ref.read(dioProvider);
    try {
      final response = await dio.get('/Encounter');
      final data = response.data as List;
      return data.map((e) => EncounterModel.fromJson(e)).toList();
    } catch (e) {
      // Fallback avec des données simulées si APi n'est pas activé pour la démo
      return _getMockEncounters();
    }
  }

  Future<List<EncounterModel>> getPatientEncounters(int patientId) async {
    final dio = ref.read(dioProvider);
    final response = await dio.get('/Encounter/patient/$patientId');
    final data = response.data as List;
    return data.map((e) => EncounterModel.fromJson(e)).toList();
  }

  Future<void> updateEncounter(int id, EncounterUpdateRequest request) async {
    final dio = ref.read(dioProvider);
    await dio.put('/Encounter/$id', data: request.toJson());
  }

  Future<void> updateStatus(int id, String status) async {
    final dio = ref.read(dioProvider);
    await dio.put('/Encounter/$id/status', data: '"$status"');
  }

  List<EncounterModel> _getMockEncounters() {
    return [
      EncounterModel(
        id: 1,
        encounterNumber: 'ENC-2026-001',
        patientId: 101,
        patientName: '',
        doctorName: 'Dr. Omar',
        status: 'Open',
        chiefComplaint: 'Maux de tête intenses et vertiges',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      EncounterModel(
        id: 2,
        encounterNumber: 'ENC-2025-002',
        patientId: 102,
        patientName: '',
        doctorName: 'Dr. Elie',
        status: 'InProgress',
        chiefComplaint: 'Fièvre, toux sèche, courbatures',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      EncounterModel(
        id: 3,
        encounterNumber: 'ENC-2026-003',
        patientId: 103,
        patientName: '',
        doctorName: 'Dr. Andy',
        status: 'Closed',
        chiefComplaint: 'Consultation de routine post-opératoire',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
