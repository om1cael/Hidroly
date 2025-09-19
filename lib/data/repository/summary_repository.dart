import 'package:hidroly/data/services/database/database_constants.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:logger/logger.dart';

class SummaryRepository {
  final DatabaseService _databaseService;
  var logger = Logger();

  SummaryRepository(this._databaseService);

  Future<int> getStreak() async {
    final db = await _databaseService.database;
    var result = await db.rawQuery('''
      SELECT COUNT(*) AS streak
      FROM (
        SELECT currentAmount, dailyGoal
        FROM ${DatabaseConstants.daysTable}
        WHERE currentAmount >= dailyGoal
      ) AS streaks;
    ''');
    
    return result[0]['streak'] as int;
  }

  Future<int> getBestStreak() async {
    final db = await _databaseService.database;
    var result = await db.rawQuery('''
      WITH streaks AS (
        SELECT
          currentAmount,
          dailyGoal,
          CASE
            WHEN currentAmount >= dailyGoal THEN 1
            ELSE 0
          END AS is_success,
          ROW_NUMBER() OVER (ORDER BY rowid) - 
          ROW_NUMBER() OVER (PARTITION BY CASE WHEN currentAmount >= dailyGoal THEN 1 ELSE 0 END ORDER BY rowid) AS streak_group
        FROM ${DatabaseConstants.daysTable}
      )
      SELECT MAX(streak_length) AS best_streak
      FROM (
        SELECT streak_group, COUNT(*) AS streak_length
        FROM streaks
        WHERE is_success = 1
        GROUP BY streak_group
      );
    ''');

    return (result[0]['best_streak'] ?? 0) as int;
  }

  Future<int> getTotalIntake() async {
    final db = await _databaseService.database;
    var result = await db.rawQuery('''
      SELECT SUM(currentAmount) AS total_intake
    FROM ${DatabaseConstants.daysTable};
    ''');

    return (result[0]['total_intake'] ?? 0) as int;
  }

  Future<double> getAverageIntake() async {
    final db = await _databaseService.database;
    var result = await db.rawQuery('''
      SELECT AVG(currentAmount) AS average_intake
      FROM ${DatabaseConstants.daysTable};
    ''');

    return (result[0]['average_intake'] ?? 0) as double;
  }

}