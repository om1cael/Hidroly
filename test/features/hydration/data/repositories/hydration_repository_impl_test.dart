import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/data/repositories/history_item_repository_impl.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/entities/history_item.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  late ProviderContainer container;
  final DateTime mockDayDate = DateTime(2026, 1, 1);

  setUp(() async {
    final appDatabase = AppDatabase(NativeDatabase.memory());

    container = ProviderContainer.test(
      overrides: [
        appDatabaseProvider.overrideWith((ref) {
          ref.onDispose(appDatabase.close);
          return appDatabase;
        }),
      ]
    );

    await container
      .read(dayRepositoryProvider)
      .save(Day(dailyGoal: Water.ml(2000), createdAt: mockDayDate));
  });

  tearDown(() => container.dispose());

  group('Hydration Repository Tests', () {
    test('Water is added and history item is created', () async {
      await container
        .read(hydrationRepositoryProvider)
        .addWater(1, 300);
      
      final day = await container
        .read(dayRepositoryProvider)
        .read(1);
      
      final historyItem = await container
        .read(historyItemRepositoryProvider)
        .readAll(1);
      
      expect(day.currentAmount.ml, 300);
      expect(historyItem.length, 1);
      expect(historyItem.first.amount.ml, 300);
    });

    test('Water and history items are removed', () async {
      await container
        .read(hydrationRepositoryProvider)
        .addWater(1, 300);
      
      Day day = await container
        .read(dayRepositoryProvider)
        .read(1);
      
      List<HistoryItem> historyItems = await container
        .read(historyItemRepositoryProvider)
        .readAll(1);
      
      expect(day.currentAmount.ml, 300);
      expect(historyItems.length, 1);
      
      await container
        .read(hydrationRepositoryProvider)
        .removeWater(1, 1, 300);
      
      day = await container
        .read(dayRepositoryProvider)
        .read(1);
      
      historyItems = await container
        .read(historyItemRepositoryProvider)
        .readAll(1);
      
      expect(day.currentAmount.ml, 0);
      expect(historyItems.length, 0);
    });

    test('Water is not removed if amount is greater than the day\'s current amount', () async {
      Day day = await container
        .read(dayRepositoryProvider)
        .read(1);
      
      expect(day.currentAmount.ml, 0);

      await container
        .read(hydrationRepositoryProvider)
        .removeWater(1, 1, 300);
      
      day = await container
        .read(dayRepositoryProvider)
        .read(1);

      expect(day.currentAmount.ml, 0);

      final historyItems = await container
        .read(historyItemRepositoryProvider)
        .readAll(1);
      
      expect(historyItems, isEmpty);
    });
  });
}