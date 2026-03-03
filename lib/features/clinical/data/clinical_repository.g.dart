// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



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

  Override overrideWithValue(ClinicalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClinicalRepository>(value),
    );
  }
}

String _$clinicalRepositoryHash() =>
    r'd9b1b4d32caf75b6c3ecce885f1e4a1558e04f27';
