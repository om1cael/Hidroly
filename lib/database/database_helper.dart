import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

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

  Future<void> createUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> getUser(int userId) async {
    final db = await database;
    final List<Map<String, Object?>> usersList = await db.query('users', where: 'id = ?', whereArgs: [userId], limit: 1);

    if(usersList.isEmpty) return null;
    Map<String, Object?> userMap = usersList.first;

    User user = User(
      id: userMap['id'] as int,
      dailyGoal: userMap['dailyGoal'] as int,
      currentAmount: userMap['currentAmount'] as int,
    );

    return user;
  }

  Future<void> createCustomCup(WaterButton waterButton) async {
    final db = await database;
    await db.insert(
      'custom_cups', 
      waterButton.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<WaterButton>> getAllCustomCups() async {
    final db = await database;
    List<Map<String, Object?>> customCups = await db.query(
      'custom_cups'
    );

    return [
      for(final { 'id': id as int, 'amount': amount as int } in customCups)
        WaterButton(id: id, amount: amount, isCustomOption: false),
    ];
  }
}