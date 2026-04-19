import 'package:hidroly/features/migration/data/repositories/migration_repository_impl.dart';
import 'package:hidroly/features/migration/ui/state/migration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_view_model.g.dart';

@riverpod
class MigrationViewModel extends _$MigrationViewModel{
  @override
  MigrationState build() => MigrationState.initial();

  void startMigration() async {
    try {
      state = MigrationState.processing();
      await ref.read(migrationRepositoryProvider).migrate();

      state = MigrationState.done();
    } catch (e) {
      state = MigrationState.error(error: e.toString());
    }
  }
}