// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



_StaffRegistrationRequest _$StaffRegistrationRequestFromJson(
  Map<String, dynamic> json,
) => _StaffRegistrationRequest(
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  role: json['role'] as String,
  facilityId: (json['facilityId'] as num).toInt(),
  department: json['department'] as String?,
);

Map<String, dynamic> _$StaffRegistrationRequestToJson(
  _StaffRegistrationRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'email': instance.email,
  'password': instance.password,
  'role': instance.role,
  'facilityId': instance.facilityId,
  'department': instance.department,
};
