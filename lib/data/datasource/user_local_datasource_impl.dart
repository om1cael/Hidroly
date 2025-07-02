import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/data/datasource/user_local_datasource.dart';
import 'package:hidroly/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final DatabaseHelper _databaseHelper;

  UserLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> createUser(User user) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateUser(User user) async {
    final db = await _databaseHelper.database;
    await db.update(
      'users', 
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id] 
    );
  }

  @override
  Future<User?> getUser(int userId) async {
    final db = await _databaseHelper.database;
    final List<Map<String, Object?>> usersList = await db.query(
      'users', 
      where: 'id = ?', 
      whereArgs: [userId], 
      limit: 1
    );

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