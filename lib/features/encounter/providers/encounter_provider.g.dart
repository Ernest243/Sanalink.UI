part of 'encounter_provider.dart';


@ProviderFor(EncounterNotifier)
final encounterProvider = EncounterNotifierProvider._();

final class EncounterNotifierProvider
    extends $AsyncNotifierProvider<EncounterNotifier, List<EncounterModel>> {
  EncounterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'encounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$encounterNotifierHash();

  @$internal
  @override
  EncounterNotifier create() => EncounterNotifier();
}

String _$encounterNotifierHash() => r'54da543627e9c49cc7f694c3f7b5bd124741bcad';

abstract class _$EncounterNotifier
    extends $AsyncNotifier<List<EncounterModel>> {
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
