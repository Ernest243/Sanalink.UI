// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(encounterRepository)
final encounterRepositoryProvider = EncounterRepositoryProvider._();

final class EncounterRepositoryProvider
    extends
        $FunctionalProvider<
          EncounterRepository,
          EncounterRepository,
          EncounterRepository
        >
    with $Provider<EncounterRepository> {
  EncounterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'encounterRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$encounterRepositoryHash();

  @$internal
  @override
  $ProviderElement<EncounterRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EncounterRepository create(Ref ref) {
    return encounterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EncounterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EncounterRepository>(value),
    );
  }
}

String _$encounterRepositoryHash() =>
    r'e187164620649f94e3fd70d91fb161b3184adf22';
