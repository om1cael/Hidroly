import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/migration/data/repositories/migration_repository_impl.dart';

import '../../../../../testing/fake_sql_user.dart';

void main() {
  late MigrationRepositoryImpl repository;
  late AppDatabase appDatabase;

  setUp(() {
    appDatabase = AppDatabase(NativeDatabase.memory(setup: (db) {
      db.execute('PRAGMA foreign_keys = ON;');
    }));
    repository = MigrationRepositoryImpl(appDatabase);
  });

  tearDown(() async {
    await appDatabase.close();
  });

  Future<NativeDatabase> createOldDatabase() async {
    final oldDb = NativeDatabase.memory();

    await oldDb.ensureOpen(FakeSqlUser());
    await oldDb.runCustom('CREATE TABLE days (id INTEGER PRIMARY KEY, dailyGoal INTEGER, currentAmount INTEGER, date TEXT NOT NULL UNIQUE)');
    await oldDb.runCustom('CREATE TABLE custom_cups (id INTEGER PRIMARY KEY, amount INTEGER)');
    await oldDb.runCustom('CREATE TABLE daily_history (id INTEGER PRIMARY KEY, dayId INTEGER, amount INTEGER, dateTime TEXT, FOREIGN KEY (dayId) REFERENCES days(id))');

    return oldDb;
  }

  group('Migration Repository Database File tests', () {
    test('Should return null if database is not found', () async {
      final result = await repository.getOldDatabase(path: '.');
      expect(result, isNull);
    });
  });

  group('Migration Repository Logic tests', () {
    test('Should do nothing and not throw if old database does not exists', () async {
      final fakeDb = Directory.systemTemp.createTempSync('empty.db').path;

      await expectLater(
        repository.migrate(pathOverride: fakeDb), 
        completes
      );

      final dbDays = await appDatabase.select(appDatabase.dayTable).get();
      expect(dbDays.length, 0);
    });

    test('Should ignore duplicate days and keep history', () async {
      final oldDb = await createOldDatabase();

      await oldDb.runCustom("INSERT INTO days VALUES (1, 2000, 500, '2026-04-19T14:01:35.318820Z')");
      await oldDb.runCustom("INSERT INTO days VALUES (2, 2000, 1200, '2026-04-19T15:01:35.318820Z')");

      await oldDb.runCustom("INSERT INTO daily_history VALUES (1, 2, 250, '2026-04-19T19:01:35.318820Z')");

      await repository.migrate(externalDb: oldDb);

      final dbDays = await appDatabase.select(appDatabase.dayTable).get();
      final dbHistory = await appDatabase.select(appDatabase.historyItemsTable).get();

      expect(dbDays.length, 1);
      expect(dbDays.first.id, 2);

      expect(dbHistory.length, 1);
      expect(dbHistory.first.id, 1);
    });

    test('Should ignore orphan history items', () async {
      final oldDb = await createOldDatabase();

      await oldDb.runCustom("INSERT INTO days VALUES (1, 2000, 500, '2026-04-19T14:01:35.318820Z')");
      await oldDb.runCustom("INSERT INTO days VALUES (2, 2000, 1200, '2026-04-19T15:01:35.318820Z')");

      await oldDb.runCustom("INSERT INTO daily_history VALUES (1, 1, 250, '2026-04-19T19:01:35.318820Z')");
      await oldDb.runCustom("INSERT INTO daily_history VALUES (2, 1, 300, '2026-04-19T19:01:35.318820Z')");
      await oldDb.runCustom("INSERT INTO daily_history VALUES (3, 2, 500, '2026-04-19T19:01:35.318820Z')");
      await oldDb.runCustom("INSERT INTO daily_history VALUES (4, 2, 750, '2026-04-19T19:01:35.318820Z')");

      await repository.migrate(externalDb: oldDb);

      final dbDays = await appDatabase.select(appDatabase.dayTable).get();
      final dbHistory = await appDatabase.select(appDatabase.historyItemsTable).get();

      expect(dbDays.length, 1);
      expect(dbDays.first.id, 2);

      expect(dbHistory.length, 2);
      expect(dbHistory.every((item) => item.day == 2), isTrue);
      expect(dbHistory.first.amount, 500);
      expect(dbHistory.last.amount, 750);
    });
  });
}