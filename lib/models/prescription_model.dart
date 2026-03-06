import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_model.freezed.dart';
part 'prescription_model.g.dart';

@freezed
abstract class PrescriptionModel with _$PrescriptionModel {
  const factory PrescriptionModel({
    required int id,
    required int patientId,
    required String medicationName,
    required String dosage,
    @Default('') String instructions,
    required String doctorName,
    // Status is not stored on the Prescription entity in the backend;
    // it defaults to 'Pending' until the pharmacist creates a dispense.
    @Default('Pending') String status,
    required DateTime createdAt,
  }) = _PrescriptionModel;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionModelFromJson(json);
}
