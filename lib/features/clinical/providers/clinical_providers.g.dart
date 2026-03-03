part of 'clinical_providers.dart';

@ProviderFor(TriageList)
final triageListProvider = TriageListProvider._();

final class TriageListProvider
    extends $AsyncNotifierProvider<TriageList, List<EncounterModel>> {
  TriageListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'triageListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$triageListHash();

  @$internal
  @override
  TriageList create() => TriageList();
}

String _$triageListHash() => r'66b7346950b5ea1cb0750755fdeeca7440739958';

abstract class _$TriageList extends $AsyncNotifier<List<EncounterModel>> {
  FutureOr<List<EncounterModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<EncounterModel>>, List<EncounterModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<EncounterModel>>,
                List<EncounterModel>
              >,
              AsyncValue<List<EncounterModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ConsultationList)
final consultationListProvider = ConsultationListProvider._();

final class ConsultationListProvider
    extends $AsyncNotifierProvider<ConsultationList, List<EncounterModel>> {
  ConsultationListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consultationListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consultationListHash();

  @$internal
  @override
  ConsultationList create() => ConsultationList();
}

String _$consultationListHash() => r'8706fba52d6091cb7c6ae20fce2ec60beda7af84';

abstract class _$ConsultationList extends $AsyncNotifier<List<EncounterModel>> {
  FutureOr<List<EncounterModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<EncounterModel>>, List<EncounterModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<EncounterModel>>,
                List<EncounterModel>
              >,
              AsyncValue<List<EncounterModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
