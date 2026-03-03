// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


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

  Override overrideWithValue(LabRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LabRepository>(value),
    );
  }
}

String _$labRepositoryHash() => r'1f78afbda5feff67ce4cc5255b60522a39657097';
