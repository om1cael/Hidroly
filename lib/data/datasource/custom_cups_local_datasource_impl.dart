import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/model/water_button.dart';
import 'package:sqflite/sqflite.dart';

class CustomCupsLocalDataSourceImpl {
  Future<void> createCustomCup(WaterButton waterButton) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert(
      'custom_cups', 
      waterButton.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<WaterButton>> getAllCustomCups() async {
    final db = await DatabaseHelper.instance.database;
    List<Map<String, Object?>> customCups = await db.query(
      'custom_cups'
    );

    return [
      for(final { 'id': id as int, 'amount': amount as int } in customCups)
        WaterButton(id: id, amount: amount, isCustomOption: false),
    ];
  }
}