// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patientLabOrders)
final patientLabOrdersProvider = PatientLabOrdersFamily._();

final class PatientLabOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LabOrderModel>>,
          List<LabOrderModel>,
          FutureOr<List<LabOrderModel>>
        >
    with
        $FutureModifier<List<LabOrderModel>>,
        $FutureProvider<List<LabOrderModel>> {
  PatientLabOrdersProvider._({
    required PatientLabOrdersFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'patientLabOrdersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$patientLabOrdersHash();

  @override
  String toString() {
    return r'patientLabOrdersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LabOrderModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LabOrderModel>> create(Ref ref) {
    final argument = this.argument as int;
    return patientLabOrders(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientLabOrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$patientLabOrdersHash() => r'4b37b7c05cb49a7747c7a2f7e4e2a33058032664';

final class PatientLabOrdersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<LabOrderModel>>, int> {
  PatientLabOrdersFamily._()
    : super(
        retry: null,
        name: r'patientLabOrdersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PatientLabOrdersProvider call(int patientId) =>
      PatientLabOrdersProvider._(argument: patientId, from: this);

  @override
  String toString() => r'patientLabOrdersProvider';
}

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
