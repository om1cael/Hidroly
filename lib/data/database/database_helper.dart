import 'package:hidroly/data/database/db_constants.dart';
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
          '''
          CREATE TABLE ${DBConstants.daysTable} (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              dailyGoal INTEGER, 
              currentAmount INTEGER,
              date TEXT NOT NULL UNIQUE
          )
          '''
        );
        await db.execute(
          '''
          CREATE TABLE ${DBConstants.customCupsTable} (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            amount INTEGER NOT NULL
          )
          '''
        );
        await db.execute(
          '''
          CREATE TABLE ${DBConstants.dailyHistoryEntryTable} (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            dayId INTEGER NOT NULL,
            amount INTEGER NOT NULL,
            dateTime TEXT NOT NULL,
            FOREIGN KEY (dayId) REFERENCES ${DBConstants.daysTable}(id)
          )
          '''
        );
      },
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      version: 2,
    );
  }
}