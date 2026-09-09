abstract class AggregateHealthService {
  Future<void> initialize();
  Future<bool> askForReadWritePermission();
  Future<void> writeHydrationData(double waterAmount, DateTime recordTime, String id);
  Future<void> deleteHydrationData(String clientRecordId);
  Future<bool> hasPermissions();
  Future<void> revokePermissions();
}