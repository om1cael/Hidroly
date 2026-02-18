import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tables/day_table.dart';

part 'app_database.g.dart';

@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@DriftDatabase(tables: [DayTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'hidroly_data',
    );
  }
}