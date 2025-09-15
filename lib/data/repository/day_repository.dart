import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/domain/models/day.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class DayRepository {
  final DatabaseService _databaseService;
  final logger = Logger();

  DayRepository(this._databaseService);

  Future<void> create(Day day) async {
    final db = await _databaseService.database;
    await db.insert(
      DatabaseConstants.daysTable,
      day.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Day day) async {
    final db = await _databaseService.database;
    await db.update(
      DatabaseConstants.daysTable, 
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id] 
    );
  }

  Future<Day?> findFirst() async {
    final db = await _databaseService.database;
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

  Future<Day?> findLatest() async {
    final db = await _databaseService.database;
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
  
  Future<Day?> findByDateRange(DateTime start, DateTime end) async {
    final db = await _databaseService.database;
    final List<Map<String, Object?>> dayList = await db.query(
      DatabaseConstants.daysTable,
      where: 'date >= ? AND date < ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
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

  Future<int> getDaysCount() async {
    try {
      final db = await _databaseService.database;
      final daysCount = await db.rawQuery('SELECT COUNT(*) FROM ${DatabaseConstants.daysTable}');
      
      return Sqflite.firstIntValue(daysCount) ?? 1;
    } catch (e) {
      logger.e('Could not retrieve days count: $e');
      return 1;
    }
  }
}