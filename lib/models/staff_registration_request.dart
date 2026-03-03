import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_registration_request.freezed.dart';
part 'staff_registration_request.g.dart';

@freezed
abstract class StaffRegistrationRequest with _$StaffRegistrationRequest {
  const factory StaffRegistrationRequest({
    required String fullName,
    required String email,
    required String password,
    required String role,
    required int facilityId,
    String? department, // Département spécialisé facultatif pour les médecins
  }) = _StaffRegistrationRequest;

  factory StaffRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$StaffRegistrationRequestFromJson(json);
}
