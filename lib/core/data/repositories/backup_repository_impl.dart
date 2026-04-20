import 'dart:convert';

import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/interfaces/file_service.dart';
import 'package:hidroly/core/domain/repositories/backup_repository.dart';
import 'package:hidroly/infra/backup/backup_file_service.dart';
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
      "database": _appDatabase.schemaVersion,
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
  Future<void> importData(String path) {
    // TODO: implement importData
    throw UnimplementedError();
  }
}