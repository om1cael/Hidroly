// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(historyItemRepository)
final historyItemRepositoryProvider = HistoryItemRepositoryProvider._();

final class HistoryItemRepositoryProvider
    extends
        $FunctionalProvider<
          HistoryItemRepository,
          HistoryItemRepository,
          HistoryItemRepository
        >
    with $Provider<HistoryItemRepository> {
  HistoryItemRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyItemRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyItemRepositoryHash();

  @$internal
  @override
  $ProviderElement<HistoryItemRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HistoryItemRepository create(Ref ref) {
    return historyItemRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryItemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryItemRepository>(value),
    );
  }
}

String _$historyItemRepositoryHash() =>
    r'671822a4b07a14d92f0adc80fd85a6c62fc9ff36';
