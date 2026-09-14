// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_water_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(removeWaterUsecase)
final removeWaterUsecaseProvider = RemoveWaterUsecaseProvider._();

final class RemoveWaterUsecaseProvider
    extends
        $FunctionalProvider<
          RemoveWaterUsecase,
          RemoveWaterUsecase,
          RemoveWaterUsecase
        >
    with $Provider<RemoveWaterUsecase> {
  RemoveWaterUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeWaterUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeWaterUsecaseHash();

  @$internal
  @override
  $ProviderElement<RemoveWaterUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoveWaterUsecase create(Ref ref) {
    return removeWaterUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoveWaterUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoveWaterUsecase>(value),
    );
  }
}

String _$removeWaterUsecaseHash() =>
    r'93510ccc18da422e1c868b35b01c5482b1b9a6da';
