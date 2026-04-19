import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/migration/domain/repositories/migration_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_repository_impl.g.dart';

@riverpod
MigrationRepository migrationRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return MigrationRepositoryImpl(appDatabase);
}

class MigrationRepositoryImpl implements MigrationRepository {
  final AppDatabase _appDatabase;

  const MigrationRepositoryImpl(this._appDatabase);

  @override
  Future<void> migrate() async {
    File? oldDb = await getOldDatabase();
    if(oldDb == null) return;

    final queryExecutor = NativeDatabase(oldDb);
    queryExecutor.ensureOpen(_FakeUser());

    await _appDatabase.transaction(() async {
      final days = await queryExecutor.runSelect('SELECT * FROM days ORDER BY id DESC', []);
      await _appDatabase.batch((batch) {
        for(final day in days) {
          final date = day['date'] as String;
          DateTime dateTime = DateTime.parse(date);
          final normalizedDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day);

          batch.insert(
            _appDatabase.dayTable, 
            DayTableCompanion.insert(
              id: Value(day['id'] as int),
              dailyGoal: day['dailyGoal'] as int,
              currentAmount: Value(day['currentAmount'] as int),
              createdAt: normalizedDateTime,
            ),
            mode: .insertOrIgnore,
          );
        }
      });

      final cups = await queryExecutor.runSelect('SELECT * FROM custom_cups', []);
      await _appDatabase.batch((batch) {
        for(final cup in cups) {
          batch.insert(
            _appDatabase.cupsTable,
            CupsTableCompanion.insert(
              id: Value(cup['id'] as int),
              amount: cup['amount'] as int,
            ),
          );
        }
      });

      final history = await queryExecutor.runSelect('SELECT * FROM daily_history', []);
      await _appDatabase.batch((batch) {
        for(final historyItem in history) {
          final date = historyItem['dateTime'] as String;
          DateTime dateTime = DateTime.parse(date);

          batch.insert(
            _appDatabase.historyItemsTable,
            HistoryItemsTableCompanion.insert(
              id: Value(historyItem['id'] as int),
              day: historyItem['dayId'] as int, 
              amount: historyItem['amount'] as int,
              createdAt: Value(dateTime),
            ),
            mode: .insertOrIgnore,
          );
        }
      });
    });
  }

  @override
  Future<void> markDatabaseAsBackup() async {
    final file = await getOldDatabase();
    if(file == null) return;

    final path = file.path;
    final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final newPath = join(path.substring(0, lastSeparator + 1), 'hidroly.db.bk');

    await file.rename(newPath);
  }
  
  @override
  Future<File?> getOldDatabase({ String? path }) async {
    try {
      final dbPath = path ?? join((await getApplicationDocumentsDirectory()).parent.path, 'databases');
      File oldDbFile = File.fromUri(Uri.parse(join(dbPath, 'hidroly.db')));

      if(!(await oldDbFile.exists())) {
        return null;
      }

      return oldDbFile;
    } on UnsupportedError catch (_) {
      return null;
    }
  }
}

class _FakeUser extends QueryExecutorUser {
  @override
  int get schemaVersion => 3;
  
  @override
  Future<void> beforeOpen(QueryExecutor executor, OpeningDetails details) async {}
}