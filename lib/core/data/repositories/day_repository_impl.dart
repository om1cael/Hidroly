import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/mappers/day_mapper.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'day_repository_impl.g.dart';

@riverpod
DayRepository dayRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return DayRepositoryImpl(appDatabase);
}

class DayRepositoryImpl implements DayRepository {
  final AppDatabase _database;

  const DayRepositoryImpl(this._database);
  
  @override
  Future<int> save(Day day) async {
    return await _database.into(_database.dayTable).insert(
      DayTableCompanion(
        dailyGoal: Value(day.dailyGoal),
      ),
    );
  }
  
  @override
  Future<Day> read(int id) async {
    final data = await (_database.select(_database.dayTable)
      ..where((day) => day.id.equals(id)))
      .getSingle();

    return data.toEntity();
  }
}