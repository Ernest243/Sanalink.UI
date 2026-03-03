import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

/// Modèle représentant un patient provenant du service Sanalink.Patient
@freezed
abstract class PatientModel with _$PatientModel {
  const factory PatientModel({
    required int id,
    required String firstName,
    String? middleName,
    required String lastName,
    required String fullName,
    required DateTime dateOfBirth,
    required String gender,
    String? phone,
    String? email,
    required int facilityId,
    required DateTime createdAt,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
}
