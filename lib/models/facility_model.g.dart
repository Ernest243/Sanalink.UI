// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FacilityModel _$FacilityModelFromJson(Map<String, dynamic> json) =>
    _FacilityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      isActive: json['isActive'] as bool?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FacilityModelToJson(_FacilityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };
