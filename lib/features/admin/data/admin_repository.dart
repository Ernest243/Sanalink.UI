import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/core/network/dio_client.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:sanalink/models/facility_model.dart';
import 'package:sanalink/models/staff_registration_request.dart';

part 'admin_repository.g.dart';

class AdminRepository {
  final Dio _dio;

  AdminRepository(this._dio);

  /// Récupère la liste de tout le personnel
  Future<List<StaffUserModel>> getAllStaff() async {
    final response = await _dio.get('/Auth/staff');
    return (response.data as List)
        .map((e) => StaffUserModel.fromJson(e))
        .toList();
  }

  /// Enregistre un nouveau membre du personnel
  Future<void> registerStaff(StaffRegistrationRequest request) async {
    await _dio.post('/Auth/register-staff', data: request.toJson());
  }

  /// Récupère la liste des établissements
  Future<List<FacilityModel>> getFacilities() async {
    final response = await _dio.get('/Facility');
    return (response.data as List)
        .map((e) => FacilityModel.fromJson(e))
        .toList();
  }

  /// Crée un nouvel établissement
  Future<void> createFacility(Map<String, dynamic> data) async {
    await _dio.post('/Facility', data: data);
  }
}

@riverpod
AdminRepository adminRepository(Ref ref) {
  return AdminRepository(ref.watch(dioProvider));
}
