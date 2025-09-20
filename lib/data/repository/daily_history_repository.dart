import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/domain/models/history_entry.dart';
import 'package:sqflite/sqlite_api.dart';

class DailyHistoryRepository {
  final DatabaseService _databaseService;

  DailyHistoryRepository(this._databaseService);

  Future<void> create(HistoryEntry historyEntry) async {
    final db = await _databaseService.database;
    await db.insert(
      DatabaseConstants.dailyHistoryEntryTable,
      historyEntry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HistoryEntry>> getAll(int day) async {
    final db = await _databaseService.database;
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
  
  Future<void> delete(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      DatabaseConstants.dailyHistoryEntryTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}