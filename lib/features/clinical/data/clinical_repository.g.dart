// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(clinicalRepository)
final clinicalRepositoryProvider = ClinicalRepositoryProvider._();

final class ClinicalRepositoryProvider
    extends
        $FunctionalProvider<
          ClinicalRepository,
          ClinicalRepository,
          ClinicalRepository
        >
    with $Provider<ClinicalRepository> {
  ClinicalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clinicalRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clinicalRepositoryHash();

  @$internal
  @override
  $ProviderElement<ClinicalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClinicalRepository create(Ref ref) {
    return clinicalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClinicalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClinicalRepository>(value),
    );
  }
}

String _$clinicalRepositoryHash() =>
    r'b9fc356c7b019129e738240968d14e063c00feec';
