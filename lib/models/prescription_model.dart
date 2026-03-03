import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_model.freezed.dart';
part 'prescription_model.g.dart';

@freezed
abstract class PrescriptionModel with _$PrescriptionModel {
  const factory PrescriptionModel({
    required int id,
    required int patientId,
    required String prescribedBy,
    required String medicationName,
    required String dosage,
    required String status,
    required DateTime createdAt,
  }) = _PrescriptionModel;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionModelFromJson(json);
}
