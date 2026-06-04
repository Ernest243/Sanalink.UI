// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EncounterModel _$EncounterModelFromJson(Map<String, dynamic> json) =>
    _EncounterModel(
      id: (json['id'] as num).toInt(),
      encounterNumber: json['encounterNumber'] as String,
      patientId: (json['patientId'] as num).toInt(),
      patientName: json['patientName'] as String? ?? '',
      doctorName: json['doctorName'] as String,
      nurseName: json['nurseName'] as String?,
      status: json['status'] as String,
      chiefComplaint: json['chiefComplaint'] as String,
      vitals: json['vitals'] as String?,
      diagnosis: json['diagnosis'] as String?,
      clinicalNotes: json['clinicalNotes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
    );

Map<String, dynamic> _$EncounterModelToJson(_EncounterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'encounterNumber': instance.encounterNumber,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'doctorName': instance.doctorName,
      'nurseName': instance.nurseName,
      'status': instance.status,
      'chiefComplaint': instance.chiefComplaint,
      'vitals': instance.vitals,
      'diagnosis': instance.diagnosis,
      'clinicalNotes': instance.clinicalNotes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
    };
