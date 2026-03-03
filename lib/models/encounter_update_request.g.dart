// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_EncounterUpdateRequest _$EncounterUpdateRequestFromJson(
  Map<String, dynamic> json,
) => _EncounterUpdateRequest(
  chiefComplaint: json['chiefComplaint'] as String?,
  vitals: json['vitals'] as String?,
  diagnosis: json['diagnosis'] as String?,
  clinicalNotes: json['clinicalNotes'] as String?,
  nurseId: json['nurseId'] as String?,
);

Map<String, dynamic> _$EncounterUpdateRequestToJson(
  _EncounterUpdateRequest instance,
) => <String, dynamic>{
  'chiefComplaint': instance.chiefComplaint,
  'vitals': instance.vitals,
  'diagnosis': instance.diagnosis,
  'clinicalNotes': instance.clinicalNotes,
  'nurseId': instance.nurseId,
};
