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
        appDatabaseProvider.overrideWith((ref) {
          ref.onDispose(appDatabase.close);
          return appDatabase;
        }),
      ]
    );
  });

  tearDown(() async {
    provider.dispose();
  });

  group('Day Repository Tests', () {
    test('Should create day if it does not exists', () async {
      final db = provider.read(appDatabaseProvider);

      // Setup day with ID 1
      await provider
        .read(dayRepositoryProvider)
        .save(Day(dailyGoal: Water.ml(2000), createdAt: DateTime(2026, 1, 1)));

      final initialDb = await db.select(db.dayTable).get();

      await provider
        .read(dayRepositoryProvider)
        .readOrCreateByDate(DateTime.now());

      final finalDb = await db.select(db.dayTable).get();

      expect(initialDb.length, isNot(finalDb.length));
    });

    test('Should not create day if it already exists', () async {
      final date = DateTime(2026, 6, 6, 12, 0, 0);
      final dateAlt = DateTime(2026, 6, 6, 21, 0, 0);

      final dayObject = Day(dailyGoal: Water.ml(2000), createdAt: date);
      
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

    test('Should get more recent day on readLatest', () async {
      final latestDayDailyGoal = 2500;

      await provider
        .read(dayRepositoryProvider)
        .save(Day(dailyGoal: Water.ml(3000), createdAt: DateTime(2026, 1, 1)));
      
      await provider
        .read(dayRepositoryProvider)
        .save(Day(dailyGoal: Water.ml(latestDayDailyGoal), createdAt: DateTime(2026, 1, 2)));
      
      final latestDay = await provider
        .read(dayRepositoryProvider)
        .readLatest();
      
      expect(latestDay.id, 2);
      expect(latestDay.dailyGoal.ml, latestDayDailyGoal);
    });
  });
}