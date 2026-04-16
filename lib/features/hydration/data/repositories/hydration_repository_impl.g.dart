// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hydrationRepository)
final hydrationRepositoryProvider = HydrationRepositoryProvider._();

final class HydrationRepositoryProvider
    extends
        $FunctionalProvider<
          HydrationRepository,
          HydrationRepository,
          HydrationRepository
        >
    with $Provider<HydrationRepository> {
  HydrationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hydrationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hydrationRepositoryHash();

  @$internal
  @override
  $ProviderElement<HydrationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HydrationRepository create(Ref ref) {
    return hydrationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HydrationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HydrationRepository>(value),
    );
  }
}

String _$hydrationRepositoryHash() =>
    r'f08b469af046444ba80a753108f896cfd37eddc1';
