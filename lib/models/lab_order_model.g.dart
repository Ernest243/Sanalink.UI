// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_LabOrderModel _$LabOrderModelFromJson(Map<String, dynamic> json) =>
    _LabOrderModel(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      requestedBy: json['requestedBy'] as String,
      testName: json['testName'] as String,
      status: json['status'] as String,
      result: json['result'] as String?,
      resultNotes: json['resultNotes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LabOrderModelToJson(_LabOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'requestedBy': instance.requestedBy,
      'testName': instance.testName,
      'status': instance.status,
      'result': instance.result,
      'resultNotes': instance.resultNotes,
      'createdAt': instance.createdAt.toIso8601String(),
    };
