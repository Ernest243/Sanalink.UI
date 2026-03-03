import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/prescription_model.dart';
import 'package:sanalink/models/pharmacy_dispense_model.dart';

part 'pharmacy_repository.g.dart';

class PharmacyRepository {
  final Dio _dio;

  PharmacyRepository(this._dio);

  /// Récupère les ordonnances
  Future<List<PrescriptionModel>> getPrescriptions() async {
    final response = await _dio.get('/Prescriptions');
    return (response.data as List)
        .map((e) => PrescriptionModel.fromJson(e))
        .toList();
  }

  /// Dispense un médicament
  Future<void> dispenseMedication(PharmacyDispenseCreateRequest request) async {
    await _dio.post('/PharmacyDispense', data: request.toJson());
  }

  /// Historique des dispensations
  Future<List<PharmacyDispenseModel>> getDispenseHistory() async {
    final response = await _dio.get('/PharmacyDispense');
    return (response.data as List)
        .map((e) => PharmacyDispenseModel.fromJson(e))
        .toList();
  }
}

@riverpod
PharmacyRepository pharmacyRepository(Ref ref) {
  return PharmacyRepository(ref.watch(dioProvider));
}
