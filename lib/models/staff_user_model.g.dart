// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



_StaffUserModel _$StaffUserModelFromJson(Map<String, dynamic> json) =>
    _StaffUserModel(
      id: json['sub'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      fullName: json['fullName'] as String,
      department: json['department'] as String?,
      facilityId: _parseInt(json['facilityId']),
    );

Map<String, dynamic> _$StaffUserModelToJson(_StaffUserModel instance) =>
    <String, dynamic>{
      'sub': instance.id,
      'email': instance.email,
      'role': instance.role,
      'fullName': instance.fullName,
      'department': instance.department,
      'facilityId': instance.facilityId,
    };
