import 'package:sanalink/features/admin/data/admin_repository.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:sanalink/models/facility_model.dart';
import 'package:sanalink/models/staff_registration_request.dart';
import 'package:sanalink/core/demo/demo_store.dart';

/// [MockAdminRepository] lié au [DemoStore].
class MockAdminRepository implements AdminRepository {
  @override
  Future<List<StaffUserModel>> getAllStaff() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const StaffUserModel(
        id: '1',
        email: 'jean@sanalink.com',
        role: 'Doctor',
        firstName: 'Jean',
        lastName: 'Kasongo',
        department: 'Médecine Générale',
        facilityId: 1,
      ),
      const StaffUserModel(
        id: '2',
        email: 'elie@sanalink.com',
        role: 'Doctor',
        firstName: 'Elie',
        lastName: 'Ilunga',
        department: 'Gynécologie',
        facilityId: 1,
      ),
      const StaffUserModel(
        id: '3',
        email: 'isabelle@sanalink.com',
        role: 'Pharmacist',
        firstName: 'Isabelle',
        lastName: 'Bola',
        department: 'Pharmacie Centrale',
        facilityId: 1,
      ),
      const StaffUserModel(
        id: '4',
        email: 'marc@sanalink.com',
        role: 'Nurse',
        firstName: 'Marc',
        lastName: 'Ipupa',
        department: 'Urgences / Triage',
        facilityId: 1,
      ),
      const StaffUserModel(
        id: '5',
        email: 'admin@sanalink.com',
        role: 'Admin',
        firstName: 'Admin',
        lastName: 'Système',
        department: 'Administration',
        facilityId: 1,
      ),
    ];
  }

  @override
  Future<void> registerStaff(StaffRegistrationRequest request) async {
    await Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Future<List<FacilityModel>> getFacilities() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      FacilityModel(
        id: 1,
        name: 'Hôpital Sanalink Centre',
        address: '123 Avenue de la Santé, kinshasa',
        type: 'General Hospital',
        createdAt: DateTime.now().subtract(const Duration(days: 365)),
      ),
    ];
  }

  @override
  Future<void> createFacility(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
