import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/features/migration/ui/state/migration_state.dart';
import 'package:hidroly/features/migration/ui/view_model/migration_view_model.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer.test();
  });

  group("Migration View Model tests", () {
    test('Should start on initial migration state', () async {
      final state = container.read(migrationViewModelProvider);
      expect(state, MigrationState.initial());
    });
  });
}