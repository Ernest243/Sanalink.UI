import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/features/pharmacy/data/pharmacy_repository.dart';
import 'package:sanalink/models/prescription_model.dart';
import 'package:sanalink/models/pharmacy_dispense_model.dart';

part 'pharmacy_providers.g.dart';

@riverpod
class PendingPrescriptions extends _$PendingPrescriptions {
  @override
  FutureOr<List<PrescriptionModel>> build() {
    return ref.watch(pharmacyRepositoryProvider).getPrescriptions();
  }
}

@riverpod
class DispenseHistory extends _$DispenseHistory {
  @override
  FutureOr<List<PharmacyDispenseModel>> build() {
    return ref.watch(pharmacyRepositoryProvider).getDispenseHistory();
  }

  Future<void> dispense(PharmacyDispenseCreateRequest request) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(pharmacyRepositoryProvider);
      await repository.dispenseMedication(request);
      ref.invalidate(pendingPrescriptionsProvider);
      return repository.getDispenseHistory();
    });
  }
}
