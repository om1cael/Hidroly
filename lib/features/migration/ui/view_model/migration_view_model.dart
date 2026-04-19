import 'package:hidroly/features/migration/ui/state/migration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_view_model.g.dart';

@riverpod
class MigrationViewModel extends _$MigrationViewModel{
  @override
  MigrationState build() => MigrationState.initial();

  void startMigration() {
    state = MigrationState.processing(progress: 0);
  }
}