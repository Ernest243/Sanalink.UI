import 'package:freezed_annotation/freezed_annotation.dart';

part 'encounter_model.freezed.dart';
part 'encounter_model.g.dart';

/// Modèle pour une consultation (Encounter)
@freezed
abstract class EncounterModel with _$EncounterModel {
  const factory EncounterModel({
    required int id,
    required String encounterNumber,
    required int patientId,
    @JsonKey(defaultValue: '') required String patientName,
    required String doctorName,
    String? nurseName,
    required String status,
    required String chiefComplaint,
    String? vitals,
    String? diagnosis,
    String? clinicalNotes,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? closedAt,
  }) = _EncounterModel;

  factory EncounterModel.fromJson(Map<String, dynamic> json) =>
      _$EncounterModelFromJson(json);
}
