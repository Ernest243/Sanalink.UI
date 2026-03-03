
part of 'patient_resolver_service.dart';


@ProviderFor(PatientResolverService)
final patientResolverServiceProvider = PatientResolverServiceProvider._();

final class PatientResolverServiceProvider
    extends $NotifierProvider<PatientResolverService, void> {
  PatientResolverServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patientResolverServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patientResolverServiceHash();

  @$internal
  @override
  PatientResolverService create() => PatientResolverService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$patientResolverServiceHash() =>
    r'aaee847d0ecae83a5bbad85a50953b7eee7c2d74';

abstract class _$PatientResolverService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
