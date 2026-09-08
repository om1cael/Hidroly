abstract class AggregateHealthService {
  Future<void> initialize();
  Future<void> askForReadWritePermission();
  Future<void> writeHydrationData(double waterAmount, DateTime recordTime);
}