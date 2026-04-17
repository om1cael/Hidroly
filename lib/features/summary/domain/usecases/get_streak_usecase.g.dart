// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_streak_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getStreakUseCase)
final getStreakUseCaseProvider = GetStreakUseCaseProvider._();

final class GetStreakUseCaseProvider
    extends
        $FunctionalProvider<
          GetStreakUseCase,
          GetStreakUseCase,
          GetStreakUseCase
        >
    with $Provider<GetStreakUseCase> {
  GetStreakUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getStreakUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getStreakUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetStreakUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetStreakUseCase create(Ref ref) {
    return getStreakUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetStreakUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetStreakUseCase>(value),
    );
  }
}

String _$getStreakUseCaseHash() => r'f7901f3b648a5eec658efe6d3804b63d11ea3ebd';
