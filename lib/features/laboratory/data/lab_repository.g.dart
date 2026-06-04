// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(labRepository)
final labRepositoryProvider = LabRepositoryProvider._();

final class LabRepositoryProvider
    extends $FunctionalProvider<LabRepository, LabRepository, LabRepository>
    with $Provider<LabRepository> {
  LabRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'labRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$labRepositoryHash();

  @$internal
  @override
  $ProviderElement<LabRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LabRepository create(Ref ref) {
    return labRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LabRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabRepository>(value),
    );
  }
}

String _$labRepositoryHash() => r'dd6296bc23ea49c8cad7115eeaf9d36fe0e6a097';
