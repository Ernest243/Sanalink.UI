import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/lab_order_model.dart';

part 'lab_repository.g.dart';

class LabRepository {
  final Dio _dio;

  LabRepository(this._dio);

  /// Récupère toutes les demandes du laboratoire
  Future<List<LabOrderModel>> getLabOrders() async {
    final response = await _dio.get('/LabOrder');
    return (response.data as List)
        .map((e) => LabOrderModel.fromJson(e))
        .toList();
  }

  /// Met à jour une demande (résultat et notes)
  Future<void> updateLabOrder(int id, String result, String notes) async {
    await _dio.put(
      '/LabOrder/$id',
      data: {'result': result, 'resultNotes': notes},
    );
  }

  /// Change le statut de la demande
  Future<void> updateStatus(int id, String status) async {
    await _dio.put('/LabOrder/$id/status', data: {'status': status});
  }
}

@riverpod
LabRepository labRepository(Ref ref) {
  return LabRepository(ref.watch(dioProvider));
}
