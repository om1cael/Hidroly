abstract class BackupRepository {
  Future<bool> exportData();
  Future<void> importData(String path);
}