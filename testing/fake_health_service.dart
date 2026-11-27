import 'package:hidroly/core/domain/interfaces/aggregate_health_service.dart';

class FakeHealthService implements AggregateHealthService {
  final deletedHydrationRecordIds = <String>[];
  final writtenHydrationRecords =
      <({double amount, DateTime recordTime, String id})>[];

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
  Future<bool> writeHydrationData(
    double waterAmount,
    DateTime recordTime,
    String id,
  ) {
    writtenHydrationRecords.add((
      amount: waterAmount,
      recordTime: recordTime,
      id: id,
    ));
    return Future.value(true);
  }

  @override
  Future<void> deleteHydrationData(String clientRecordId) {
    deletedHydrationRecordIds.add(clientRecordId);
    return Future.value();
  }
}
