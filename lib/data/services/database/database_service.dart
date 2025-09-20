import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
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
          CREATE TABLE ${DatabaseConstants.daysTable} (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              dailyGoal INTEGER, 
              currentAmount INTEGER,
              date TEXT NOT NULL UNIQUE
          )
          '''
        );
        await db.execute(
          '''
          CREATE TABLE ${DatabaseConstants.customCupsTable} (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            amount INTEGER NOT NULL,
            position INTEGER NOT NULL
          )
          '''
        );
        await db.execute(
          '''
          CREATE TABLE ${DatabaseConstants.dailyHistoryEntryTable} (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            dayId INTEGER NOT NULL,
            amount INTEGER NOT NULL,
            dateTime TEXT NOT NULL,
            FOREIGN KEY (dayId) REFERENCES ${DatabaseConstants.daysTable}(id)
          )
          '''
        );
      },
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if(oldVersion < 3) {
          await db.execute(
            '''
            ALTER TABLE ${DatabaseConstants.customCupsTable}
            ADD COLUMN position INTEGER DEFAULT 0 NOT NULL
            '''
          );
          await db.execute(
            '''
            UPDATE ${DatabaseConstants.customCupsTable}
            SET position = rowid
            '''
          );
        }
      },
      version: 3,
    );
  }
}