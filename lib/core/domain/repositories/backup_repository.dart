import 'package:result_dart/result_dart.dart';

abstract class BackupRepository {
  Future<void> exportData();
  Future<Result<void>> importData();
}