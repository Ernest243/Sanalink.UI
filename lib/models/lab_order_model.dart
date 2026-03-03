import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_order_model.freezed.dart';
part 'lab_order_model.g.dart';

@freezed
abstract class LabOrderModel with _$LabOrderModel {
  const factory LabOrderModel({
    required int id,
    required int patientId,
    required String requestedBy,
    required String testName,
    required String status,
    String? result,
    String? resultNotes,
    required DateTime createdAt,
  }) = _LabOrderModel;

  factory LabOrderModel.fromJson(Map<String, dynamic> json) =>
      _$LabOrderModelFromJson(json);
}
