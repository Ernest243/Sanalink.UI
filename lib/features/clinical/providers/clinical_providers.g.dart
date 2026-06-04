// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$triageListHash() => r'f155dce9bfab5506e2fe067b36dcc95d3aa77ff0';

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

String _$consultationListHash() => r'1a6147dd905da78e1e23d69dd929202fccb2b916';

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
