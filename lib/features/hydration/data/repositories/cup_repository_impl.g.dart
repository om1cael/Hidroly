// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cup_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cupRepository)
final cupRepositoryProvider = CupRepositoryProvider._();

final class CupRepositoryProvider
    extends $FunctionalProvider<CupRepository, CupRepository, CupRepository>
    with $Provider<CupRepository> {
  CupRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cupRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cupRepositoryHash();

  @$internal
  @override
  $ProviderElement<CupRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CupRepository create(Ref ref) {
    return cupRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CupRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CupRepository>(value),
    );
  }
}

String _$cupRepositoryHash() => r'56c3393448d0bc2860fd953066c41153a8ed4940';
