import 'dart:convert';
import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/exceptions/unsupported_database_exception.dart';
import 'package:hidroly/core/domain/interfaces/file_service.dart';
import 'package:hidroly/core/domain/repositories/backup_repository.dart';
import 'package:hidroly/infra/backup/backup_file_service.dart';
import 'package:result_dart/result_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_repository_impl.g.dart';

@riverpod
BackupRepository backupRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  final fileService = ref.watch(backupFileServiceProvider);

  return BackupRepositoryImpl(appDatabase, fileService);
}

class BackupRepositoryImpl implements BackupRepository {
  final AppDatabase _appDatabase;
  final FileService _fileService;

  const BackupRepositoryImpl(this._appDatabase, this._fileService);
  
  @override
  Future<void> exportData() async {
    final days = await _appDatabase
      .select(_appDatabase.dayTable)
      .get();
    
    final history = await _appDatabase
      .select(_appDatabase.historyItemsTable)
      .get();
    
    final cups = await _appDatabase
      .select(_appDatabase.cupsTable)
      .get();
    
    final daysJson = days.map((day) => day.toJson()).toList();
    final historyJson = history.map((item) => item.toJson()).toList();
    final cupsJson = cups.map((cup) => cup.toJson()).toList();

    final date = DateTime.now().toIso8601String();

    final exportMap = {
      "database": _appDatabase.schemaVersion + 1,
      "date": date,
      "payload": {
        "days": daysJson,
        "history": historyJson,
        "cups": cupsJson,
      }
    };

    final exportJson = jsonEncode(exportMap);
    final fileName = "hidroly_backup_$date.json";

    await _fileService.saveSingleFile(fileName, exportJson);
  }

  @override
  Future<Result<void>> importData() async {
    try {
      final content = await _fileService.readSingleFile();
      final json = jsonDecode(content);
      
      if(json['database'] != _appDatabase.schemaVersion) {
        return Failure(UnsupportedDatabaseException('The backup\'s database version is different'));
      }

      await _appDatabase.transaction(() async {
        await Future.wait([
          _appDatabase.delete(_appDatabase.dayTable).go(),
          _appDatabase.delete(_appDatabase.historyItemsTable).go(),
          _appDatabase.delete(_appDatabase.cupsTable).go(),
        ]);

        
        await _appDatabase.batch((batch) {
          for(final day in json['payload']['days']) {
            batch.insert(
              _appDatabase.dayTable, 
              DayTableCompanion.insert(
                id: Value(day['id'] as int),
                dailyGoal: day['dailyGoal'] as int, 
                currentAmount: Value(day['currentAmount'] as int),
                createdAt: DateTime.fromMillisecondsSinceEpoch(day['createdAt'] as int),
              ),
            );
          }
        });

        await _appDatabase.batch((batch) {
          for(final historyItem in json['payload']['history']) {
            batch.insert(
              _appDatabase.historyItemsTable, 
              HistoryItemsTableCompanion.insert(
                id: Value(historyItem['id'] as int),
                day: historyItem['day'] as int,
                amount: historyItem['amount'] as int,
                createdAt: Value(DateTime.fromMillisecondsSinceEpoch(historyItem['createdAt'] as int)),
              ),
            );
          }
        });

        await _appDatabase.batch((batch) {
          for(final cup in json['payload']['cups']) {
            batch.insert(
              _appDatabase.cupsTable, 
              CupsTableCompanion.insert(
                id: Value(cup['id'] as int),
                amount: cup['amount'] as int,
                createdAt: Value(DateTime.fromMillisecondsSinceEpoch(cup['createdAt'] as int)),
              ),
            );
          }
        });
      });

      return Success(Void);
    } on FormatException catch (_) {
      return Failure(InvalidInputException('The JSON file is probably invalid'));
    } catch(e) {
      return Failure(Exception('Unknown error'));
    }
  }
}