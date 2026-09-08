import 'package:hidroly/core/domain/interfaces/aggregate_health_service.dart';

class FakeHealthService implements AggregateHealthService{
  @override
  Future<bool> askForReadWritePermission() {
    return Future.value(true);
  }

  @override
  Future<bool> hasPermissions() {
    return Future.value(true);
  }

  @override
  Future<void> initialize() {
    return Future.value();
  }

  @override
  Future<void> revokePermissions() {
    return Future.value();
  }

  @override
  Future<void> writeHydrationData(double waterAmount, DateTime recordTime) {
    return Future.value();
  }
}