// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaffUserModel _$StaffUserModelFromJson(Map<String, dynamic> json) =>
    _StaffUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      department: json['department'] as String?,
      facilityId: _parseInt(json['facilityId']),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$StaffUserModelToJson(_StaffUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'department': instance.department,
      'facilityId': instance.facilityId,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
