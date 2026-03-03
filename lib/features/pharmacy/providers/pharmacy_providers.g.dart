part of 'pharmacy_providers.dart';


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
