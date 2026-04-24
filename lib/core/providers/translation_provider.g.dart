// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(translationProvider)
final translationProviderProvider = TranslationProviderProvider._();

final class TranslationProviderProvider
    extends
        $FunctionalProvider<
          TranslationProvider,
          TranslationProvider,
          TranslationProvider
        >
    with $Provider<TranslationProvider> {
  TranslationProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'translationProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$translationProviderHash();

  @$internal
  @override
  $ProviderElement<TranslationProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TranslationProvider create(Ref ref) {
    return translationProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TranslationProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TranslationProvider>(value),
    );
  }
}

String _$translationProviderHash() =>
    r'7a317cf062ba120b32566dc2d58318a522bb570f';
