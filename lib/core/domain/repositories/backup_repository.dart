abstract class BackupRepository {
  Future<String> exportData();
  Future<void> importData(String path);
}