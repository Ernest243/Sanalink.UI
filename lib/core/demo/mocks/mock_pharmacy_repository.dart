import 'package:sanalink/features/pharmacy/data/pharmacy_repository.dart';
import 'package:sanalink/models/prescription_model.dart';
import 'package:sanalink/models/pharmacy_dispense_model.dart';
import 'package:sanalink/core/demo/demo_store.dart';

/// [MockPharmacyRepository] lié au [DemoStore].
class MockPharmacyRepository implements PharmacyRepository {
  final _store = DemoStore.instance;

  @override
  Future<List<PrescriptionModel>> getPrescriptions() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _store.prescriptions;
  }

  @override
  Future<void> dispenseMedication(PharmacyDispenseCreateRequest request) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final index = _store.prescriptions.indexWhere(
      (p) => p.id == request.prescriptionId,
    );
    if (index != -1) {
      _store.prescriptions[index] = _store.prescriptions[index].copyWith(
        status: 'Dispensed',
      );

      _store.dispenses.add(
        PharmacyDispenseModel(
          id: _store.dispenses.length + 1,
          prescriptionId: request.prescriptionId,
          quantityDispensed: request.quantityDispensed,
          status: 'Completed',
          dispensedAt: DateTime.now(),
          notes: request.notes,
        ),
      );
    }
  }

  @override
  Future<List<PharmacyDispenseModel>> getDispenseHistory() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _store.dispenses;
  }
}
