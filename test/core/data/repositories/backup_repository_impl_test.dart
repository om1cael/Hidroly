import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/backup_repository_impl.dart';
import 'package:hidroly/core/domain/enums/backup_status.dart';
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
      appDatabase.into(appDatabase.dayTable).insert(
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
}