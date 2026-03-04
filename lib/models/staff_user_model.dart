import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_user_model.freezed.dart';
part 'staff_user_model.g.dart';

int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}

/// Modèle pour l'utilisateur du personnel
@freezed
abstract class StaffUserModel with _$StaffUserModel {
  const factory StaffUserModel({
    @JsonKey(name: 'sub') required String id,
    required String email,
    required String role,
    required String firstName,
    required String lastName,
    String? department,
    @JsonKey(fromJson: _parseInt) int? facilityId,
  }) = _StaffUserModel;

  factory StaffUserModel.fromJson(Map<String, dynamic> json) =>
      _$StaffUserModelFromJson(json);
}

extension StaffUserModelX on StaffUserModel {
  String get fullName => '$firstName $lastName'.trim();
}
