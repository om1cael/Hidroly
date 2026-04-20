import 'package:hidroly/core/domain/enums/export_status.dart';
import 'package:result_dart/result_dart.dart';

abstract class BackupRepository {
  Future<Result<ExportStatus>> exportData();
  Future<Result<void>> importData();
}