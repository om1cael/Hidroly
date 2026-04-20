import 'dart:convert';

import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/repositories/backup_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_repository_impl.g.dart';

@riverpod
BackupRepository backupRepositor(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return BackupRepositoryImpl(appDatabase);
}

class BackupRepositoryImpl implements BackupRepository {
  final AppDatabase _appDatabase;

  const BackupRepositoryImpl(this._appDatabase);
  
  @override
  Future<String> exportData() async {
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

    final exportMap = {
      "database": _appDatabase.schemaVersion,
      "date": DateTime.now().toIso8601String(),
      "payload": {
        "days": daysJson,
        "history": historyJson,
        "cups": cupsJson,
      }
    };

    return jsonEncode(exportMap);
  }

  @override
  Future<void> importData(String path) {
    // TODO: implement importData
    throw UnimplementedError();
  }
}