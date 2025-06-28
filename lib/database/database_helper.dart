import 'package:hidroly/model/User.dart';
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
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, dailyGoal INTEGER, currentAmount INTEGER)'
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
}