// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



_PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) =>
    _PrescriptionModel(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      prescribedBy: json['prescribedBy'] as String,
      medicationName: json['medicationName'] as String,
      dosage: json['dosage'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PrescriptionModelToJson(_PrescriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'prescribedBy': instance.prescribedBy,
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
