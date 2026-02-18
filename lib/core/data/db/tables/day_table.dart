import 'package:drift/drift.dart';

class DayTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyGoal => integer()();
  IntColumn get currentAmount => integer()();
  DateTimeColumn get createdAt => dateTime()();
}