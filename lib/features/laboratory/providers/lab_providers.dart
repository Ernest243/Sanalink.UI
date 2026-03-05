import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/features/laboratory/data/lab_repository.dart';
import 'package:sanalink/models/lab_order_model.dart';

part 'lab_providers.g.dart';

@riverpod
Future<List<LabOrderModel>> patientLabOrders(Ref ref, int patientId) {
  return ref.watch(labRepositoryProvider).getLabOrdersByPatient(patientId);
}

@riverpod
class LabOrderList extends _$LabOrderList {
  @override
  FutureOr<List<LabOrderModel>> build() {
    return ref.watch(labRepositoryProvider).getLabOrders();
  }

  Future<void> updateResult(int id, String result, String notes) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(labRepositoryProvider);
      await repository.updateLabOrder(id, result, notes);
      await repository.updateStatus(id, 'Completed');
      return repository.getLabOrders();
    });
  }

  Future<void> updateStatus(int id, String status) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(labRepositoryProvider);
      await repository.updateStatus(id, status);
      return repository.getLabOrders();
    });
  }
}
