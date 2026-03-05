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
    final response = await dio.get('Encounter');
    final data = response.data as List;
    return data.map((e) => EncounterModel.fromJson(e)).toList();
  }

  Future<List<EncounterModel>> getPatientEncounters(int patientId) async {
    final dio = ref.read(dioProvider);
    final response = await dio.get('Encounter/patient/$patientId');
    final data = response.data as List;
    return data.map((e) => EncounterModel.fromJson(e)).toList();
  }

  Future<void> updateEncounter(int id, EncounterUpdateRequest request) async {
    final dio = ref.read(dioProvider);
    await dio.put('Encounter/$id', data: request.toJson());
  }

  Future<void> updateStatus(int id, String status) async {
    final dio = ref.read(dioProvider);
    await dio.put('Encounter/$id/status', data: '"$status"');
  }

  Future<EncounterModel> createEncounter(
    int patientId,
    String chiefComplaint, {
    String? vitals,
  }) async {
    final dio = ref.read(dioProvider);
    final response = await dio.post('Encounter', data: {
      'patientId': patientId,
      'chiefComplaint': chiefComplaint,
      if (vitals != null) 'vitals': vitals,
    });
    return EncounterModel.fromJson(response.data);
  }
}
