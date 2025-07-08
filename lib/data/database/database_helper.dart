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
              currentAmount INTEGER
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
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if(oldVersion < 2) {
          await db.execute('DROP TABLE IF EXISTS users');
          await db.execute(
            '''
            CREATE TABLE ${DBConstants.daysTable} (
                id INTEGER PRIMARY KEY AUTOINCREMENT, 
                dailyGoal INTEGER, 
                currentAmount INTEGER
            )
            '''
          );
        }
      },
      version: 2,
    );
  }
}