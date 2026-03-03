part of 'lab_providers.dart';


@ProviderFor(LabOrderList)
final labOrderListProvider = LabOrderListProvider._();

final class LabOrderListProvider
    extends $AsyncNotifierProvider<LabOrderList, List<LabOrderModel>> {
  LabOrderListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'labOrderListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$labOrderListHash();

  @$internal
  @override
  LabOrderList create() => LabOrderList();
}

String _$labOrderListHash() => r'68441eeb1b7ffda8956fdeaedb2a20ac2a99341f';

abstract class _$LabOrderList extends $AsyncNotifier<List<LabOrderModel>> {
  FutureOr<List<LabOrderModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<LabOrderModel>>, List<LabOrderModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LabOrderModel>>, List<LabOrderModel>>,
              AsyncValue<List<LabOrderModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
