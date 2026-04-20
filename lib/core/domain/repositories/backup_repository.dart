import 'package:hidroly/core/domain/enums/backup_status.dart';
import 'package:result_dart/result_dart.dart';

abstract class BackupRepository {
  Future<Result<BackupStatus>> exportData();
  Future<Result<BackupStatus>> importData();
}