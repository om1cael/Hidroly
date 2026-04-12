import 'package:drift/native.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  late ProviderContainer provider;

  setUp(() {
    final appDatabase = AppDatabase(NativeDatabase.memory());

    provider = ProviderContainer.test(
      overrides: [
        appDatabaseProvider.overrideWith((ref) => appDatabase),
      ]
    );
  });

  group('Day Repository Tests', () {
    test('Should not create day if it already exists', () async {
      final date = DateTime(2026, 6, 6, 12, 0, 0);
      final dateAlt = DateTime(2026, 6, 6, 21, 0, 0);

      final dayObject = Day(dailyGoal: Water(2000), createdAt: date);
      
      final rowId = await provider.read(dayRepositoryProvider).save(dayObject);
      final day = await provider
        .read(dayRepositoryProvider)
        .read(rowId);

      final queryDay = await provider
        .read(dayRepositoryProvider)
        .readOrCreateByDate(dateAlt);

      expect(day, isNotNull);
      expect(queryDay.id, equals(day.id));
    });
  });
}