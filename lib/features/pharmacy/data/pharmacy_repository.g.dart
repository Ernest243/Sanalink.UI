// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

  Override overrideWithValue(PharmacyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PharmacyRepository>(value),
    );
  }
}

String _$pharmacyRepositoryHash() =>
    r'a177c6081db9afebecab5cde8bbcc6bbefa9f3d8';
