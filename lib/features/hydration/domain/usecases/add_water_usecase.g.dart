// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_water_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addWaterUsecase)
final addWaterUsecaseProvider = AddWaterUsecaseProvider._();

final class AddWaterUsecaseProvider
    extends
        $FunctionalProvider<AddWaterUsecase, AddWaterUsecase, AddWaterUsecase>
    with $Provider<AddWaterUsecase> {
  AddWaterUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addWaterUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addWaterUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddWaterUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddWaterUsecase create(Ref ref) {
    return addWaterUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddWaterUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddWaterUsecase>(value),
    );
  }
}

String _$addWaterUsecaseHash() => r'4428a54cefe5f6cbec99a412424e6a9bee8f0626';
