import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/data/datasource/custom_cups_local_datasource.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:sqflite/sqflite.dart';

class CustomCupsLocalDataSourceImpl implements CustomCupsLocalDataSource {
  final DatabaseService _databaseHelper;

  CustomCupsLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> createCustomCup(WaterButton waterButton) async {
    final db = await _databaseHelper.database;
    await db.insert(
      DatabaseConstants.customCupsTable, 
      waterButton.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<WaterButton>> getAllCustomCups() async {
    final db = await _databaseHelper.database;
    List<Map<String, Object?>> customCups = await db.query(
      DatabaseConstants.customCupsTable
    );

    return [
      for(final { 'id': id as int, 'amount': amount as int, 'position': position as int, } in customCups)
        WaterButton(id: id, amount: amount, position: position),
    ];
  }

  @override
  Future<void> updateCustomCup(WaterButton waterButton) async {
    final db = await _databaseHelper.database;
    await db.update(
      DatabaseConstants.customCupsTable,
      waterButton.toMap(),
      where: 'id = ?',
      whereArgs: [waterButton.id]
    );
  }

  @override
  Future<void> deleteCustomCup(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      DatabaseConstants.customCupsTable, 
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}