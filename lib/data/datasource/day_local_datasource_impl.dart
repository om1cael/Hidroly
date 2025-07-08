import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/data/database/db_constants.dart';
import 'package:hidroly/data/datasource/day_local_datasource.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:sqflite/sqflite.dart';

class DayLocalDataSourceImpl implements DayLocalDataSource {
  final DatabaseHelper _databaseHelper;

  DayLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> create(Day day) async {
    final db = await _databaseHelper.database;
    await db.insert(
      DBConstants.daysTable,
      day.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> update(Day day) async {
    final db = await _databaseHelper.database;
    await db.update(
      DBConstants.daysTable, 
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id] 
    );
  }

  @override
  Future<Day?> read(int id) async {
    final db = await _databaseHelper.database;
    final List<Map<String, Object?>> daysList = await db.query(
      DBConstants.daysTable, 
      where: 'id = ?', 
      whereArgs: [id], 
      limit: 1
    );

    if(daysList.isEmpty) return null;
    Map<String, Object?> dayMap = daysList.first;

    Day day = Day(
      id: dayMap['id'] as int,
      dailyGoal: dayMap['dailyGoal'] as int,
      currentAmount: dayMap['currentAmount'] as int,
    );

    return day;
  }
}