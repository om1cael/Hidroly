// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weekly_chart_data_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getWeeklyChartDataUseCase)
final getWeeklyChartDataUseCaseProvider = GetWeeklyChartDataUseCaseProvider._();

final class GetWeeklyChartDataUseCaseProvider
    extends
        $FunctionalProvider<
          GetWeeklyChartDataUseCase,
          GetWeeklyChartDataUseCase,
          GetWeeklyChartDataUseCase
        >
    with $Provider<GetWeeklyChartDataUseCase> {
  GetWeeklyChartDataUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getWeeklyChartDataUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getWeeklyChartDataUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetWeeklyChartDataUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetWeeklyChartDataUseCase create(Ref ref) {
    return getWeeklyChartDataUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetWeeklyChartDataUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetWeeklyChartDataUseCase>(value),
    );
  }
}

String _$getWeeklyChartDataUseCaseHash() =>
    r'4e64ffdd50b9055cb1b8643533fe09716afa3e6a';
