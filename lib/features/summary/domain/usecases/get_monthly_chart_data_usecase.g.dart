// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_monthly_chart_data_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMonthlyChartDataUseCase)
final getMonthlyChartDataUseCaseProvider =
    GetMonthlyChartDataUseCaseProvider._();

final class GetMonthlyChartDataUseCaseProvider
    extends
        $FunctionalProvider<
          GetMonthlyChartDataUsecase,
          GetMonthlyChartDataUsecase,
          GetMonthlyChartDataUsecase
        >
    with $Provider<GetMonthlyChartDataUsecase> {
  GetMonthlyChartDataUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMonthlyChartDataUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMonthlyChartDataUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMonthlyChartDataUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMonthlyChartDataUsecase create(Ref ref) {
    return getMonthlyChartDataUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMonthlyChartDataUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMonthlyChartDataUsecase>(value),
    );
  }
}

String _$getMonthlyChartDataUseCaseHash() =>
    r'c432b6b903ee255ac4b15c6a9092e8de0eeb5f2b';
