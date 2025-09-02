import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/domain/models/water_button.dart';
import 'package:sqflite/sqflite.dart';

class CustomCupsRepository {
  final DatabaseService _databaseService;

  CustomCupsRepository(this._databaseService);

  Future<void> createCustomCup(WaterButton waterButton) async {
    final db = await _databaseService.database;
    await db.insert(
      DatabaseConstants.customCupsTable, 
      waterButton.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<WaterButton>> getAllCustomCups() async {
    final db = await _databaseService.database;
    List<Map<String, Object?>> customCups = await db.query(
      DatabaseConstants.customCupsTable
    );

    return [
      for(final { 'id': id as int, 'amount': amount as int, 'position': position as int, } in customCups)
        WaterButton(id: id, amount: amount, position: position),
    ];
  }

  Future<void> updateCustomCup(WaterButton waterButton) async {
    final db = await _databaseService.database;
    await db.update(
      DatabaseConstants.customCupsTable,
      waterButton.toMap(),
      where: 'id = ?',
      whereArgs: [waterButton.id]
    );
  }

  Future<void> deleteCustomCup(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      DatabaseConstants.customCupsTable, 
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}