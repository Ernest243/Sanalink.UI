// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StaffList)
final staffListProvider = StaffListProvider._();

final class StaffListProvider
    extends $AsyncNotifierProvider<StaffList, List<StaffUserModel>> {
  StaffListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffListHash();

  @$internal
  @override
  StaffList create() => StaffList();
}

String _$staffListHash() => r'4b0244398f6b108d26452170ebf69463e046cf19';

abstract class _$StaffList extends $AsyncNotifier<List<StaffUserModel>> {
  FutureOr<List<StaffUserModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<StaffUserModel>>, List<StaffUserModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<StaffUserModel>>,
                List<StaffUserModel>
              >,
              AsyncValue<List<StaffUserModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FacilityList)
final facilityListProvider = FacilityListProvider._();

final class FacilityListProvider
    extends $AsyncNotifierProvider<FacilityList, List<FacilityModel>> {
  FacilityListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facilityListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facilityListHash();

  @$internal
  @override
  FacilityList create() => FacilityList();
}

String _$facilityListHash() => r'f083d4030fd354cc36ceff51fefb15ccd0d1fc3c';

abstract class _$FacilityList extends $AsyncNotifier<List<FacilityModel>> {
  FutureOr<List<FacilityModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<FacilityModel>>, List<FacilityModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FacilityModel>>, List<FacilityModel>>,
              AsyncValue<List<FacilityModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
