// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MigrationViewModel)
final migrationViewModelProvider = MigrationViewModelProvider._();

final class MigrationViewModelProvider
    extends $NotifierProvider<MigrationViewModel, MigrationState> {
  MigrationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'migrationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$migrationViewModelHash();

  @$internal
  @override
  MigrationViewModel create() => MigrationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MigrationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MigrationState>(value),
    );
  }
}

String _$migrationViewModelHash() =>
    r'a79abf9d6cd39abd18a2111a828732d903b25d03';

abstract class _$MigrationViewModel extends $Notifier<MigrationState> {
  MigrationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MigrationState, MigrationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MigrationState, MigrationState>,
              MigrationState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
