import 'package:freezed_annotation/freezed_annotation.dart';

part 'encounter_update_request.freezed.dart';
part 'encounter_update_request.g.dart';

@freezed
abstract class EncounterUpdateRequest with _$EncounterUpdateRequest {
  const factory EncounterUpdateRequest({
    String? chiefComplaint,
    String? vitals,
    String? diagnosis,
    String? clinicalNotes,
    String? nurseId,
  }) = _EncounterUpdateRequest;

  factory EncounterUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$EncounterUpdateRequestFromJson(json);
}
