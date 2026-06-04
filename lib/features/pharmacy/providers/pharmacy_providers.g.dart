// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientPrescriptions)
final patientPrescriptionsProvider = PatientPrescriptionsFamily._();

final class PatientPrescriptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PrescriptionModel>>,
          List<PrescriptionModel>,
          FutureOr<List<PrescriptionModel>>
        >
    with
        $FutureModifier<List<PrescriptionModel>>,
        $FutureProvider<List<PrescriptionModel>> {
  PatientPrescriptionsProvider._({
    required PatientPrescriptionsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'patientPrescriptionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientPrescriptionsHash();

  @override
  String toString() {
    return r'patientPrescriptionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PrescriptionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PrescriptionModel>> create(Ref ref) {
    final argument = this.argument as int;
    return patientPrescriptions(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientPrescriptionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientPrescriptionsHash() =>
    r'1c06fd34087e2ec16327ce55e6576009a1ff88fc';

final class PatientPrescriptionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PrescriptionModel>>, int> {
  PatientPrescriptionsFamily._()
    : super(
        retry: null,
        name: r'patientPrescriptionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientPrescriptionsProvider call(int patientId) =>
      PatientPrescriptionsProvider._(argument: patientId, from: this);

  @override
  String toString() => r'patientPrescriptionsProvider';
}

@ProviderFor(PrescriptionWriter)
final prescriptionWriterProvider = PrescriptionWriterProvider._();

final class PrescriptionWriterProvider
    extends $AsyncNotifierProvider<PrescriptionWriter, void> {
  PrescriptionWriterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prescriptionWriterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prescriptionWriterHash();

  @$internal
  @override
  PrescriptionWriter create() => PrescriptionWriter();
}

String _$prescriptionWriterHash() =>
    r'b025d118c15f05673a8665db5a7e4d0c291c5534';

abstract class _$PrescriptionWriter extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PendingPrescriptions)
final pendingPrescriptionsProvider = PendingPrescriptionsProvider._();

final class PendingPrescriptionsProvider
    extends
        $AsyncNotifierProvider<PendingPrescriptions, List<PrescriptionModel>> {
  PendingPrescriptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingPrescriptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingPrescriptionsHash();

  @$internal
  @override
  PendingPrescriptions create() => PendingPrescriptions();
}

String _$pendingPrescriptionsHash() =>
    r'94b2d4af633c8cb82e60c2313d2810da7170f96e';

abstract class _$PendingPrescriptions
    extends $AsyncNotifier<List<PrescriptionModel>> {
  FutureOr<List<PrescriptionModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PrescriptionModel>>,
              List<PrescriptionModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PrescriptionModel>>,
                List<PrescriptionModel>
              >,
              AsyncValue<List<PrescriptionModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DispenseHistory)
final dispenseHistoryProvider = DispenseHistoryProvider._();

final class DispenseHistoryProvider
    extends
        $AsyncNotifierProvider<DispenseHistory, List<PharmacyDispenseModel>> {
  DispenseHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dispenseHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dispenseHistoryHash();

  @$internal
  @override
  DispenseHistory create() => DispenseHistory();
}

String _$dispenseHistoryHash() => r'52d32cd658d4933cddd09a9f96a75f91b518ff00';

abstract class _$DispenseHistory
    extends $AsyncNotifier<List<PharmacyDispenseModel>> {
  FutureOr<List<PharmacyDispenseModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PharmacyDispenseModel>>,
              List<PharmacyDispenseModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PharmacyDispenseModel>>,
                List<PharmacyDispenseModel>
              >,
              AsyncValue<List<PharmacyDispenseModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
