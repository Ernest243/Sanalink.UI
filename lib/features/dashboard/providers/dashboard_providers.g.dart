// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appointmentAnalytics)
final appointmentAnalyticsProvider = AppointmentAnalyticsProvider._();

final class AppointmentAnalyticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppointmentAnalytics>,
          AppointmentAnalytics,
          FutureOr<AppointmentAnalytics>
        >
    with
        $FutureModifier<AppointmentAnalytics>,
        $FutureProvider<AppointmentAnalytics> {
  AppointmentAnalyticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentAnalyticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentAnalyticsHash();

  @$internal
  @override
  $FutureProviderElement<AppointmentAnalytics> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppointmentAnalytics> create(Ref ref) {
    return appointmentAnalytics(ref);
  }
}

String _$appointmentAnalyticsHash() =>
    r'94725383057735826a8459a34a3a9d9ec99b4bf5';

@ProviderFor(activeStaffCount)
final activeStaffCountProvider = ActiveStaffCountProvider._();

final class ActiveStaffCountProvider
    extends
        $FunctionalProvider<
          AsyncValue<StaffCount>,
          StaffCount,
          FutureOr<StaffCount>
        >
    with $FutureModifier<StaffCount>, $FutureProvider<StaffCount> {
  ActiveStaffCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeStaffCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeStaffCountHash();

  @$internal
  @override
  $FutureProviderElement<StaffCount> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<StaffCount> create(Ref ref) {
    return activeStaffCount(ref);
  }
}

String _$activeStaffCountHash() => r'0d75712f92269a4271698da4812d939865afb437';

/// Single source-of-truth for all encounters on the dashboard.
/// Both [recentEncountersProvider] and [encounterAnalyticsProvider] derive
/// from this to avoid two separate heavy network calls.

@ProviderFor(allEncounters)
final allEncountersProvider = AllEncountersProvider._();

/// Single source-of-truth for all encounters on the dashboard.
/// Both [recentEncountersProvider] and [encounterAnalyticsProvider] derive
/// from this to avoid two separate heavy network calls.

final class AllEncountersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EncounterModel>>,
          List<EncounterModel>,
          FutureOr<List<EncounterModel>>
        >
    with
        $FutureModifier<List<EncounterModel>>,
        $FutureProvider<List<EncounterModel>> {
  /// Single source-of-truth for all encounters on the dashboard.
  /// Both [recentEncountersProvider] and [encounterAnalyticsProvider] derive
  /// from this to avoid two separate heavy network calls.
  AllEncountersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allEncountersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allEncountersHash();

  @$internal
  @override
  $FutureProviderElement<List<EncounterModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<EncounterModel>> create(Ref ref) {
    return allEncounters(ref);
  }
}

String _$allEncountersHash() => r'cc46075b22cfa3beb10379e95dedd2b0848bb7f8';

@ProviderFor(recentEncounters)
final recentEncountersProvider = RecentEncountersProvider._();

final class RecentEncountersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EncounterModel>>,
          List<EncounterModel>,
          FutureOr<List<EncounterModel>>
        >
    with
        $FutureModifier<List<EncounterModel>>,
        $FutureProvider<List<EncounterModel>> {
  RecentEncountersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentEncountersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentEncountersHash();

  @$internal
  @override
  $FutureProviderElement<List<EncounterModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<EncounterModel>> create(Ref ref) {
    return recentEncounters(ref);
  }
}

String _$recentEncountersHash() => r'bdbd41a897926c695e04dd64f0f7b03988717ada';

/// Computed client-side from [allEncountersProvider].
/// The API has no dedicated /Encounter/analytics endpoint.

@ProviderFor(encounterAnalytics)
final encounterAnalyticsProvider = EncounterAnalyticsProvider._();

/// Computed client-side from [allEncountersProvider].
/// The API has no dedicated /Encounter/analytics endpoint.

final class EncounterAnalyticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<EncounterAnalytics>,
          EncounterAnalytics,
          FutureOr<EncounterAnalytics>
        >
    with
        $FutureModifier<EncounterAnalytics>,
        $FutureProvider<EncounterAnalytics> {
  /// Computed client-side from [allEncountersProvider].
  /// The API has no dedicated /Encounter/analytics endpoint.
  EncounterAnalyticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'encounterAnalyticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$encounterAnalyticsHash();

  @$internal
  @override
  $FutureProviderElement<EncounterAnalytics> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EncounterAnalytics> create(Ref ref) {
    return encounterAnalytics(ref);
  }
}

String _$encounterAnalyticsHash() =>
    r'0eff7a45cb71ebde51d151d703ca5ba65f53d93f';

@ProviderFor(appointmentsPerDay)
final appointmentsPerDayProvider = AppointmentsPerDayProvider._();

final class AppointmentsPerDayProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppointmentsPerDay>,
          AppointmentsPerDay,
          FutureOr<AppointmentsPerDay>
        >
    with
        $FutureModifier<AppointmentsPerDay>,
        $FutureProvider<AppointmentsPerDay> {
  AppointmentsPerDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentsPerDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentsPerDayHash();

  @$internal
  @override
  $FutureProviderElement<AppointmentsPerDay> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppointmentsPerDay> create(Ref ref) {
    return appointmentsPerDay(ref);
  }
}

String _$appointmentsPerDayHash() =>
    r'20eb931925abcacd5d59bab1fac1ad163131aa02';

@ProviderFor(patientRegistrations)
final patientRegistrationsProvider = PatientRegistrationsFamily._();

final class PatientRegistrationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppointmentsPerDay>,
          AppointmentsPerDay,
          FutureOr<AppointmentsPerDay>
        >
    with
        $FutureModifier<AppointmentsPerDay>,
        $FutureProvider<AppointmentsPerDay> {
  PatientRegistrationsProvider._({
    required PatientRegistrationsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'patientRegistrationsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientRegistrationsHash();

  @override
  String toString() {
    return r'patientRegistrationsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AppointmentsPerDay> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppointmentsPerDay> create(Ref ref) {
    final argument = this.argument as int;
    return patientRegistrations(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientRegistrationsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientRegistrationsHash() =>
    r'856eed65a5192ea0fb3d49ac01384798b6c8a5d3';

final class PatientRegistrationsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AppointmentsPerDay>, int> {
  PatientRegistrationsFamily._()
    : super(
        retry: null,
        name: r'patientRegistrationsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientRegistrationsProvider call(int days) =>
      PatientRegistrationsProvider._(argument: days, from: this);

  @override
  String toString() => r'patientRegistrationsProvider';
}

/// Computed client-side from GET Prescriptions.
/// The API has no dedicated /Prescriptions/analytics endpoint.

@ProviderFor(prescriptionAnalytics)
final prescriptionAnalyticsProvider = PrescriptionAnalyticsFamily._();

/// Computed client-side from GET Prescriptions.
/// The API has no dedicated /Prescriptions/analytics endpoint.

final class PrescriptionAnalyticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppointmentsPerDay>,
          AppointmentsPerDay,
          FutureOr<AppointmentsPerDay>
        >
    with
        $FutureModifier<AppointmentsPerDay>,
        $FutureProvider<AppointmentsPerDay> {
  /// Computed client-side from GET Prescriptions.
  /// The API has no dedicated /Prescriptions/analytics endpoint.
  PrescriptionAnalyticsProvider._({
    required PrescriptionAnalyticsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'prescriptionAnalyticsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prescriptionAnalyticsHash();

  @override
  String toString() {
    return r'prescriptionAnalyticsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AppointmentsPerDay> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppointmentsPerDay> create(Ref ref) {
    final argument = this.argument as int;
    return prescriptionAnalytics(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PrescriptionAnalyticsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prescriptionAnalyticsHash() =>
    r'f616f99bd2da34e340ebfc400e7e79916bdb7332';

/// Computed client-side from GET Prescriptions.
/// The API has no dedicated /Prescriptions/analytics endpoint.

final class PrescriptionAnalyticsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AppointmentsPerDay>, int> {
  PrescriptionAnalyticsFamily._()
    : super(
        retry: null,
        name: r'prescriptionAnalyticsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Computed client-side from GET Prescriptions.
  /// The API has no dedicated /Prescriptions/analytics endpoint.

  PrescriptionAnalyticsProvider call(int days) =>
      PrescriptionAnalyticsProvider._(argument: days, from: this);

  @override
  String toString() => r'prescriptionAnalyticsProvider';
}
