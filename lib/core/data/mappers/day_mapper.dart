import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/entities/day.dart';

extension DayTableDataX on DayTableData {
  Day toEntity() {
    return Day(
      id: id,
      dailyGoal: dailyGoal,
      currentAmount: currentAmount, 
      createdAt: createdAt
    );
  }
}