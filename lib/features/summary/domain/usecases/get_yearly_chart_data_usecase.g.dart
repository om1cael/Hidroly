// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_yearly_chart_data_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getYearlyChartDataUsecase)
final getYearlyChartDataUsecaseProvider = GetYearlyChartDataUsecaseProvider._();

final class GetYearlyChartDataUsecaseProvider
    extends
        $FunctionalProvider<
          GetYearlyChartDataUsecase,
          GetYearlyChartDataUsecase,
          GetYearlyChartDataUsecase
        >
    with $Provider<GetYearlyChartDataUsecase> {
  GetYearlyChartDataUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getYearlyChartDataUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getYearlyChartDataUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetYearlyChartDataUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetYearlyChartDataUsecase create(Ref ref) {
    return getYearlyChartDataUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetYearlyChartDataUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetYearlyChartDataUsecase>(value),
    );
  }
}

String _$getYearlyChartDataUsecaseHash() =>
    r'fb6894514b37ae4f6a37c61ab4d03bebb555fdf8';
