// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_FacilityModel _$FacilityModelFromJson(Map<String, dynamic> json) =>
    _FacilityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FacilityModelToJson(_FacilityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
    };
