import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/data/database/db_constants.dart';
import 'package:hidroly/data/datasource/custom_cups_local_datasource.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:sqflite/sqflite.dart';

class CustomCupsLocalDataSourceImpl implements CustomCupsLocalDataSource {
  final DatabaseHelper _databaseHelper;

  CustomCupsLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> createCustomCup(WaterButton waterButton) async {
    final db = await _databaseHelper.database;
    await db.insert(
      DBConstants.customCupsTable, 
      waterButton.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<WaterButton>> getAllCustomCups() async {
    final db = await _databaseHelper.database;
    List<Map<String, Object?>> customCups = await db.query(
      DBConstants.customCupsTable
    );

    return [
      for(final { 'id': id as int, 'amount': amount as int } in customCups)
        WaterButton(id: id, amount: amount),
    ];
  }

  @override
  Future<void> updateCustomCup(WaterButton waterButton) async {
    final db = await _databaseHelper.database;
    await db.update(
      DBConstants.customCupsTable,
      waterButton.toMap(),
      where: 'id = ?',
      whereArgs: [waterButton.id]
    );
  }

  @override
  Future<void> deleteCustomCup(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      DBConstants.customCupsTable, 
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}