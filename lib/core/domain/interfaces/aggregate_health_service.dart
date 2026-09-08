abstract class AggregateHealthService {
  Future<void> initialize();
  Future<void> writeHydrationData(double waterAmount);
}