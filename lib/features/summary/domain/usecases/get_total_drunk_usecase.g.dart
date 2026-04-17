// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_total_drunk_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTotalDrunkUseCase)
final getTotalDrunkUseCaseProvider = GetTotalDrunkUseCaseProvider._();

final class GetTotalDrunkUseCaseProvider
    extends
        $FunctionalProvider<
          GetTotalDrunkUseCase,
          GetTotalDrunkUseCase,
          GetTotalDrunkUseCase
        >
    with $Provider<GetTotalDrunkUseCase> {
  GetTotalDrunkUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTotalDrunkUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTotalDrunkUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTotalDrunkUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTotalDrunkUseCase create(Ref ref) {
    return getTotalDrunkUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTotalDrunkUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTotalDrunkUseCase>(value),
    );
  }
}

String _$getTotalDrunkUseCaseHash() =>
    r'b3e4536136bf86ff2cc0aff3db3cf7a272d3192e';
