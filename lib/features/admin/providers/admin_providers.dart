import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sanalink/features/admin/data/admin_repository.dart';
import 'package:sanalink/models/staff_user_model.dart';
import 'package:sanalink/models/facility_model.dart';
import 'package:sanalink/models/staff_registration_request.dart';

part 'admin_providers.g.dart';

@riverpod
class StaffList extends _$StaffList {
  @override
  FutureOr<List<StaffUserModel>> build() {
    return ref.watch(adminRepositoryProvider).getAllStaff();
  }

  Future<void> registerStaff(StaffRegistrationRequest request) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(adminRepositoryProvider).registerStaff(request);
      return ref.read(adminRepositoryProvider).getAllStaff();
    });
  }
}

@riverpod
class FacilityList extends _$FacilityList {
  @override
  FutureOr<List<FacilityModel>> build() {
    return ref.watch(adminRepositoryProvider).getFacilities();
  }

  Future<void> createFacility(String name, String address, String type) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(adminRepositoryProvider).createFacility({
        'name': name,
        'address': address,
        'type': type,
        'createdAt': DateTime.now().toIso8601String(),
      });
      return ref.read(adminRepositoryProvider).getFacilities();
    });
  }
}
