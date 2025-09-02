import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/data/datasource/day_local_datasource.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:sqflite/sqflite.dart';

class DayLocalDataSourceImpl implements DayLocalDataSource {
  final DatabaseService _databaseHelper;

  DayLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> create(Day day) async {
    final db = await _databaseHelper.database;
    await db.insert(
      DatabaseConstants.daysTable,
      day.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> update(Day day) async {
    final db = await _databaseHelper.database;
    await db.update(
      DatabaseConstants.daysTable, 
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id] 
    );
  }

  @override
  Future<Day?> findFirst() async {
    final db = await _databaseHelper.database;
    final List<Map<String, Object?>> daysList = await db.query(
      DatabaseConstants.daysTable, 
      orderBy: 'date ASC',
      limit: 1
    );

    if(daysList.isEmpty) return null;
    Map<String, Object?> dayMap = daysList.first;

    Day day = Day(
      id: dayMap['id'] as int,
      dailyGoal: dayMap['dailyGoal'] as int,
      currentAmount: dayMap['currentAmount'] as int,
      date: DateTime.parse(dayMap['date'] as String),
    );

    return day;
  }

  @override
  Future<Day?> findLatest() async {
    final db = await _databaseHelper.database;
    final List<Map<String, Object?>> daysList = await db.query(
      DatabaseConstants.daysTable, 
      orderBy: 'date DESC',
      limit: 1
    );

    if(daysList.isEmpty) return null;
    Map<String, Object?> dayMap = daysList.first;

    Day day = Day(
      id: dayMap['id'] as int,
      dailyGoal: dayMap['dailyGoal'] as int,
      currentAmount: dayMap['currentAmount'] as int,
      date: DateTime.parse(dayMap['date'] as String),
    );

    return day;
  }
  
  @override
  Future<Day?> findByDate(String start, String end) async {
    final db = await _databaseHelper.database;
    final List<Map<String, Object?>> dayList = await db.query(
      DatabaseConstants.daysTable,
      where: 'date >= ? AND date < ?',
      whereArgs: [start, end],
      orderBy: 'date DESC',
      limit: 1,
    );

    if(dayList.isEmpty) return null;
    Map<String, Object?> dayMap = dayList.first;
    
    return Day(
      id: dayMap['id'] as int,
      dailyGoal: dayMap['dailyGoal'] as int,
      currentAmount: dayMap['currentAmount'] as int,
      date: DateTime.parse(dayMap['date'] as String),
    );
  }
}