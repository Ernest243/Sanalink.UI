import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/encounter_model.dart';

part 'clinical_repository.g.dart';

class ClinicalRepository {
  final Dio _dio;

  ClinicalRepository(this._dio);

  /// Récupère par statut (Encounter)
  Future<List<EncounterModel>> getEncounters({String? status}) async {
    final response = await _dio.get(
      '/Encounter',
      queryParameters: {if (status != null) 'status': status},
    );
    return (response.data as List)
        .map((e) => EncounterModel.fromJson(e))
        .toList();
  }

  /// Met à jour les constantes vitale (Encounter)
  Future<void> updateVitals(int id, Map<String, dynamic> vitals) async {
    await _dio.put('/Encounter/$id', data: {'vitals': vitals});
  }

  /// Change le statut (Encounter)
  Future<void> updateStatus(int id, String status) async {
    await _dio.put('/Encounter/$id/status', data: {'status': status});
  }

  /// Sauvegarde le diagnostic et les notes (Docteur)
  Future<void> saveConsultation(int id, String diagnosis, String notes) async {
    await _dio.put(
      '/Encounter/$id',
      data: {'diagnosis': diagnosis, 'clinicalNotes': notes},
    );
  }

  /// Ajoute une note clinique pour un patient
  /// POST /api/v1/Notes
  Future<void> addNote(int patientId, String content) async {
    await _dio.post(
      '/Notes',
      data: {'patientId': patientId, 'content': content},
    );
  }
}

@riverpod
ClinicalRepository clinicalRepository(Ref ref) {
  return ClinicalRepository(ref.watch(dioProvider));
}
