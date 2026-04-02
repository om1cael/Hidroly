import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/domain/repositories/hydration_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydration_repository_impl.g.dart';

@riverpod
HydrationRepository hydrationRepository(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return HydrationRepositoryImpl(database);
}

class HydrationRepositoryImpl implements HydrationRepository {
  final AppDatabase _database;

  const HydrationRepositoryImpl(this._database);
  
  @override
  Future<void> addWater(int dayId, int waterAmount) async {
    await _database.transaction(() async {
      final day = await (_database.select(_database.dayTable)
        ..where((day) => day.id.equals(dayId)))
        .getSingle();
      
      final newCurrentAmount = day.currentAmount + waterAmount;

      await _database.into(_database.historyItemsTable).insert(
        HistoryItemsTableCompanion(
          day: Value(day.id),
          amount: Value(waterAmount),
        )
      );

      await (_database.update(_database.dayTable)
        ..where((day) => day.id.equals(dayId)))
        .write(DayTableCompanion(
          currentAmount: Value(newCurrentAmount),
        ));
    });
  }
}