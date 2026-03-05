import 'package:sanalink/features/laboratory/data/lab_repository.dart';
import 'package:sanalink/models/lab_order_model.dart';
import 'package:sanalink/core/demo/demo_store.dart';

/// [MockLabRepository] lié au [DemoStore].
/// Les requêtes générées en consultation apparaissent ici.
class MockLabRepository implements LabRepository {
  final _store = DemoStore.instance;

  @override
  Future<List<LabOrderModel>> getLabOrders() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _store.labOrders;
  }

  @override
  Future<void> updateLabOrder(int id, String result, String notes) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _store.labOrders.indexWhere((o) => o.id == id);
    if (index != -1) {
      _store.labOrders[index] = _store.labOrders[index].copyWith(
        result: result,
        resultNotes: notes,
        status: 'Completed',
      );
    }
  }

  @override
  Future<void> updateStatus(int id, String status) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _store.labOrders.indexWhere((o) => o.id == id);
    if (index != -1) {
      _store.labOrders[index] = _store.labOrders[index].copyWith(
        status: status,
      );
    }
  }

  @override
  Future<List<LabOrderModel>> getLabOrdersByPatient(int patientId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _store.labOrders.where((o) => o.patientId == patientId).toList();
  }
}
