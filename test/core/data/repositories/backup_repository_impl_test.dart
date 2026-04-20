import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/backup_repository_impl.dart';
import 'package:hidroly/core/domain/enums/backup_status.dart';
import 'package:hidroly/core/domain/exceptions/unsupported_database_exception.dart';
import 'package:hidroly/core/domain/interfaces/file_service.dart';
import 'package:hidroly/core/domain/repositories/backup_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/infra/mock_file_service.dart';

void main() {
  late AppDatabase appDatabase;
  late BackupRepository repository;
  late FileService fileService;

  setUp(() {
    appDatabase = AppDatabase(NativeDatabase.memory());
    fileService = MockFileService();

    repository = BackupRepositoryImpl(appDatabase, fileService);
  });

  tearDown(() => appDatabase.close());

  group('Backup Repository Export tests', () {
    test('Should return success status if file service returns a string', () async {
      when(() => fileService.saveSingleFile(any(), any())).thenAnswer((_) async => Success('hidroly_backup.json'));
      final result = await repository.exportData();

      expect(result, isA<Success>());
      expect(result.getOrNull(), BackupStatus.success);
    });

    test('Should return canceled status if file service returns empty string', () async {
      when(() => fileService.saveSingleFile(any(), any())).thenAnswer((_) async => Success(''));
      final result = await repository.exportData();

      expect(result, isA<Success>());
      expect(result.getOrNull(), BackupStatus.cancelled);
    });

    test('Should not crash if some tables are empty', () async {
      await appDatabase.into(appDatabase.dayTable).insert(
        DayTableCompanion(
          id: Value(1),
          dailyGoal: Value(2000),
          currentAmount: Value(1000),
          createdAt: Value(DateTime(2026, 1, 1)),
        )
      );

      await repository.exportData();

      final captured = verify(() => fileService.saveSingleFile(any(), captureAny())).captured;
      final json = captured.first;

      expect(captured, isNotEmpty);

      final jsonData = jsonDecode(json);

      expect(jsonData['database'], 1);
      expect(jsonData['payload']['days'].length, 1);
      expect(jsonData['payload']['history'].length, 0);
      expect(jsonData['payload']['cups'].length, 0);
    });
  });

  group('Backup Repository Import tests', () {
    test('Should return canceled state if user didn\'t choose a file', () async {
      when(() => fileService.readSingleFile()).thenAnswer((_) async => Success(''));
      final status = await repository.importData();

      expect(status.getOrThrow(), BackupStatus.cancelled);
    });

    test('Should not import if file has a different database schema version', () async {
      final content = '{"database": 2}';
      when(() => fileService.readSingleFile()).thenAnswer((_) async => Success(content));

      final result = await repository.importData();

      expect(result, isA<Failure>());
      expect(() => result.getOrThrow(), throwsA(isA<UnsupportedDatabaseException>()));

      final days = await appDatabase.select(appDatabase.dayTable).get();
      expect(days, isEmpty);
    });

    test('Should not crash if JSON is invalid', () async {
      final content = '{"database": 1, "datp": "aaa"}';
      when(() => fileService.readSingleFile()).thenAnswer((_) async => Success(content));

      final result = await repository.importData();

      expect(result, isA<Failure>());
      expect(() => result.getOrThrow(), throwsA(isA<Exception>()));
    });

    test('Should import if everything is fine', () async {
      final mockData = {
        "database": 1,
        "date": DateTime.now().toIso8601String(),
        "payload": {
          "days": [{"id": 1, "dailyGoal": 1960, "currentAmount": 0, "createdAt": 1776567600000}],
          "history": [],
          "cups": []
        }
      };
      when(() => fileService.readSingleFile()).thenAnswer((_) async => Success(jsonEncode(mockData)));

      final result = await repository.importData();

      expect(result, isA<Success>());
      expect(result.getOrThrow(), BackupStatus.success);

      final days = await appDatabase.select(appDatabase.dayTable).get();
      final history = await appDatabase.select(appDatabase.historyItemsTable).get();
      final cups = await appDatabase.select(appDatabase.cupsTable).get();

      expect(days.length, 1);
      expect(history.length, 0);
      expect(cups.length, 0);

      expect(days.first.id, 1);
      expect(days.first.dailyGoal, 1960);
      expect(days.first.currentAmount, 0);
      expect(days.first.createdAt, DateTime.fromMillisecondsSinceEpoch(1776567600000));
    });
  });
}