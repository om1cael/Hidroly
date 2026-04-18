// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_daily_average_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDailyAverageUseCase)
final getDailyAverageUseCaseProvider = GetDailyAverageUseCaseProvider._();

final class GetDailyAverageUseCaseProvider
    extends
        $FunctionalProvider<
          GetDailyAverageUseCase,
          GetDailyAverageUseCase,
          GetDailyAverageUseCase
        >
    with $Provider<GetDailyAverageUseCase> {
  GetDailyAverageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDailyAverageUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDailyAverageUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetDailyAverageUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetDailyAverageUseCase create(Ref ref) {
    return getDailyAverageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetDailyAverageUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetDailyAverageUseCase>(value),
    );
  }
}

String _$getDailyAverageUseCaseHash() =>
    r'7ab954fcdbbf1b06e1f8b33e1a7c4c6a83e9168e';
