import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';

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
}