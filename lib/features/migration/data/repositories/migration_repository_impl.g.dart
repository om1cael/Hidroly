// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(migrationRepository)
final migrationRepositoryProvider = MigrationRepositoryProvider._();

final class MigrationRepositoryProvider
    extends
        $FunctionalProvider<
          MigrationRepository,
          MigrationRepository,
          MigrationRepository
        >
    with $Provider<MigrationRepository> {
  MigrationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'migrationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$migrationRepositoryHash();

  @$internal
  @override
  $ProviderElement<MigrationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MigrationRepository create(Ref ref) {
    return migrationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MigrationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MigrationRepository>(value),
    );
  }
}

String _$migrationRepositoryHash() =>
    r'1f930bccd573819806ba48b263ace81245dd09cd';
