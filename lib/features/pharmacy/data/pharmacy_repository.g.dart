// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pharmacyRepository)
final pharmacyRepositoryProvider = PharmacyRepositoryProvider._();

final class PharmacyRepositoryProvider
    extends
        $FunctionalProvider<
          PharmacyRepository,
          PharmacyRepository,
          PharmacyRepository
        >
    with $Provider<PharmacyRepository> {
  PharmacyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pharmacyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pharmacyRepositoryHash();

  @$internal
  @override
  $ProviderElement<PharmacyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PharmacyRepository create(Ref ref) {
    return pharmacyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PharmacyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PharmacyRepository>(value),
    );
  }
}

String _$pharmacyRepositoryHash() =>
    r'dced4f21f4f34c89d51579c8fa285f08fec89cb8';
