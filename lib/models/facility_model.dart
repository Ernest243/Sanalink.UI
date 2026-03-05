import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_model.freezed.dart';
part 'facility_model.g.dart';

@freezed
abstract class FacilityModel with _$FacilityModel {
  const factory FacilityModel({
    required int id,
    required String name,
    String? address,
    String? phone,
    String? email,
    bool? isActive,
    required DateTime createdAt,
  }) = _FacilityModel;

  factory FacilityModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityModelFromJson(json);
}
