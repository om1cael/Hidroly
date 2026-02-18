import 'package:drift/drift.dart';
import 'tables/day_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [DayTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}