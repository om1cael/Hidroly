abstract class BackupRepository {
  Future<void> exportData();
  Future<void> importData(String path);
}