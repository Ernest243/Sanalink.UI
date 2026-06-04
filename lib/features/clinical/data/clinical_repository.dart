import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/encounter_model.dart';
import 'package:sanalink/models/note_model.dart';

part 'clinical_repository.g.dart';

class ClinicalRepository {
  final Dio _dio;

  ClinicalRepository(this._dio);

  /// Récupère les consultations, filtrées par statut si fourni.
  Future<List<EncounterModel>> getEncounters({String? status}) async {
    final response = await _dio.get(
      'Encounter',
      queryParameters: {if (status != null) 'status': status},
    );
    return (response.data as List)
        .map((e) => EncounterModel.fromJson(e))
        .toList();
  }

  /// Met à jour les constantes vitales d'une consultation.
  Future<void> updateVitals(
    int id,
    Map<String, dynamic> vitals, {
    String? nurseId,
  }) async {
    final vitalsStr =
        'TA: ${vitals['bloodPressure']}, FC: ${vitals['heartRate']}, Temp: ${vitals['temperature']}C';
    await _dio.put('Encounter/$id', data: {
      'vitals': vitalsStr,
      if (nurseId != null) 'nurseId': nurseId,
    });
  }

  /// Change le statut d'une consultation.
  Future<void> updateStatus(int id, String status) async {
    await _dio.put('Encounter/$id/status', data: {'status': status});
  }

  /// Sauvegarde le diagnostic et les notes cliniques.
  Future<void> saveConsultation(int id, String diagnosis, String notes) async {
    await _dio.put(
      'Encounter/$id',
      data: {'diagnosis': diagnosis, 'clinicalNotes': notes},
    );
  }

  /// Récupère les notes cliniques d'un patient.
  Future<List<NoteModel>> getPatientNotes(int patientId) async {
    final response = await _dio.get('Notes/patient/$patientId');
    return (response.data as List)
        .map((e) => NoteModel.fromJson(e))
        .toList();
  }

  /// Ajoute une note clinique pour un patient.
  Future<void> addNote(int patientId, String content) async {
    await _dio.post(
      'Notes',
      data: {'patientId': patientId, 'content': content},
    );
  }
}

@riverpod
ClinicalRepository clinicalRepository(Ref ref) {
  return ClinicalRepository(ref.watch(dioProvider));
}
