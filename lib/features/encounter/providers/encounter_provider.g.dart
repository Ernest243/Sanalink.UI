// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$encounterNotifierHash() => r'cc1e595f265cf9eb12cef6b36d4931b03f93a87d';

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
