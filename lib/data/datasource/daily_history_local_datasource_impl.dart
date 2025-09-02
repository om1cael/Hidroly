import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/data/datasource/daily_history_local_datasource.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:sqflite/sqflite.dart';

class DailyHistoryLocalDataSourceImpl extends DailyHistoryLocalDataSource {
  final DatabaseService _databaseHelper;

  DailyHistoryLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> create(HistoryEntry historyEntry) async {
    final db = await _databaseHelper.database;
    await db.insert(
      DatabaseConstants.dailyHistoryEntryTable,
      historyEntry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<HistoryEntry>> getAll(int day) async {
    final db = await _databaseHelper.database;
    final List<Map<String, Object?>> dailyHistoryList = await db.query(
      DatabaseConstants.dailyHistoryEntryTable,
      where: 'dayId = ?',
      whereArgs: [day],
    );

    return [
      for(final {'id': id as int, 'dayId': dayId as int, 'amount': amount as int, 'dateTime': dateTime as String} in dailyHistoryList)
        HistoryEntry(id: id, dayId: dayId, amount: amount, dateTime: DateTime.parse(dateTime))
    ];
  }
  
  @override
  Future<void> delete(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      DatabaseConstants.dailyHistoryEntryTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}