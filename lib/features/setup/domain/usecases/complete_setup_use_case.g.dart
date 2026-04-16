// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_setup_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(completeSetupUseCase)
final completeSetupUseCaseProvider = CompleteSetupUseCaseProvider._();

final class CompleteSetupUseCaseProvider
    extends
        $FunctionalProvider<
          CompleteSetupUseCase,
          CompleteSetupUseCase,
          CompleteSetupUseCase
        >
    with $Provider<CompleteSetupUseCase> {
  CompleteSetupUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completeSetupUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completeSetupUseCaseHash();

  @$internal
  @override
  $ProviderElement<CompleteSetupUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompleteSetupUseCase create(Ref ref) {
    return completeSetupUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompleteSetupUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompleteSetupUseCase>(value),
    );
  }
}

String _$completeSetupUseCaseHash() =>
    r'79959a40f3bb0d5ac15a99d2ee744984dd5158cb';
