import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/mappers/day_mapper.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
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
        dailyGoal: Value(day.dailyGoal.ml),
        createdAt: Value(normalize(day.createdAt))
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

  @override
  Future<List<Day>> readAll() async {
    final dayTableDataList = await (_database
      .select(_database.dayTable)
      ..orderBy([(u) => OrderingTerm(expression: u.createdAt, mode: .desc)]))
      .get();
    
    return [for(final day in dayTableDataList) day.toEntity()];
  }

  @override
  Future<List<Day>> readByRange(DateTime start, DateTime end) async {
    final dayTableDataList = await (_database
      .select(_database.dayTable)
      ..orderBy([(u) => OrderingTerm(expression: u.createdAt, mode: .desc)])
      ..where((day) => day.createdAt.isBiggerOrEqualValue(start) & day.createdAt.isSmallerOrEqualValue(end)))
      .get();
    
    return [for(final day in dayTableDataList) day.toEntity()];
  }
  
  @override
  Future<Day> readOrCreateByDate(DateTime date) async {
    final normalizedDate = normalize(date);

    final data = await (_database.select(_database.dayTable)
      ..where((day) => day.createdAt.equals(normalizedDate)))
      .getSingleOrNull();
    
    if(data != null) return data.toEntity();

    final firstDay = await (_database.select(_database.dayTable)
      ..limit(1))
      .getSingle();

    final rowId = await save(
      Day(
        dailyGoal: Water.ml(firstDay.dailyGoal), 
        createdAt: date,
      )
    );

    return await read(rowId);
  }

  DateTime normalize(DateTime date) =>
    DateTime(date.year, date.month, date.day);
}