abstract class AggregateHealthService {
  Future<void> initialize();
  Future<bool> askForReadWritePermission();
  Future<void> writeHydrationData(double waterAmount, DateTime recordTime);
  Future<bool> hasPermissions();
  Future<void> revokePermissions();
}