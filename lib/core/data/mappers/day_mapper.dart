import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';

extension DayTableDataX on DayTableData {
  Day toEntity() {
    return Day(
      id: id,
      dailyGoal: Water(dailyGoal),
      currentAmount: Water(0), 
      createdAt: createdAt
    );
  }
}