import 'package:freezed_annotation/freezed_annotation.dart';

part 'pharmacy_dispense_model.freezed.dart';
part 'pharmacy_dispense_model.g.dart';

@freezed
abstract class PharmacyDispenseModel with _$PharmacyDispenseModel {
  const factory PharmacyDispenseModel({
    required int id,
    required int prescriptionId,
    required int quantityDispensed,
    required String status,
    required DateTime dispensedAt,
    String? notes,
  }) = _PharmacyDispenseModel;

  factory PharmacyDispenseModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyDispenseModelFromJson(json);
}

@freezed
abstract class PharmacyDispenseCreateRequest
    with _$PharmacyDispenseCreateRequest {
  const factory PharmacyDispenseCreateRequest({
    required int prescriptionId,
    required int quantityDispensed,
    String? notes,
  }) = _PharmacyDispenseCreateRequest;

  factory PharmacyDispenseCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PharmacyDispenseCreateRequestFromJson(json);
}
