// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dayRepository)
final dayRepositoryProvider = DayRepositoryProvider._();

final class DayRepositoryProvider
    extends $FunctionalProvider<DayRepository, DayRepository, DayRepository>
    with $Provider<DayRepository> {
  DayRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dayRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dayRepositoryHash();

  @$internal
  @override
  $ProviderElement<DayRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DayRepository create(Ref ref) {
    return dayRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DayRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DayRepository>(value),
    );
  }
}

String _$dayRepositoryHash() => r'a72b61fd239a0b6fd5cdb163fd94082750a83051';
