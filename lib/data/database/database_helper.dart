import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'hidroly.db');
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, dailyGoal INTEGER, currentAmount INTEGER)'
        );
        await db.execute(
          'CREATE TABLE custom_cups(id INTEGER PRIMARY KEY AUTOINCREMENT, amount INTEGER NOT NULL)'
        );
      },
      version: 1,
    );
  }
}