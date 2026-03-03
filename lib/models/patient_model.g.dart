// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_PatientModel _$PatientModelFromJson(Map<String, dynamic> json) =>
    _PatientModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      fullName: json['fullName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      facilityId: (json['facilityId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PatientModelToJson(_PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'facilityId': instance.facilityId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
