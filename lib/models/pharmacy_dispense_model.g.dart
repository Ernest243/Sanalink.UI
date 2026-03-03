// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_dispense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_PharmacyDispenseModel _$PharmacyDispenseModelFromJson(
  Map<String, dynamic> json,
) => _PharmacyDispenseModel(
  id: (json['id'] as num).toInt(),
  prescriptionId: (json['prescriptionId'] as num).toInt(),
  quantityDispensed: (json['quantityDispensed'] as num).toInt(),
  status: json['status'] as String,
  dispensedAt: DateTime.parse(json['dispensedAt'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$PharmacyDispenseModelToJson(
  _PharmacyDispenseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'prescriptionId': instance.prescriptionId,
  'quantityDispensed': instance.quantityDispensed,
  'status': instance.status,
  'dispensedAt': instance.dispensedAt.toIso8601String(),
  'notes': instance.notes,
};

_PharmacyDispenseCreateRequest _$PharmacyDispenseCreateRequestFromJson(
  Map<String, dynamic> json,
) => _PharmacyDispenseCreateRequest(
  prescriptionId: (json['prescriptionId'] as num).toInt(),
  quantityDispensed: (json['quantityDispensed'] as num).toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$PharmacyDispenseCreateRequestToJson(
  _PharmacyDispenseCreateRequest instance,
) => <String, dynamic>{
  'prescriptionId': instance.prescriptionId,
  'quantityDispensed': instance.quantityDispensed,
  'notes': instance.notes,
};
