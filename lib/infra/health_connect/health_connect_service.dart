import 'package:health/health.dart';
import 'package:hidroly/core/domain/interfaces/aggregate_health_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_connect_service.g.dart';

@riverpod
AggregateHealthService healthConnectService(Ref ref) {
  return HealthConnectService(Health());
}

class HealthConnectService implements AggregateHealthService {
  Health healthInstance;

  HealthConnectService(this.healthInstance);

  final types = [HealthDataType.WATER];
  final permissions = [HealthDataAccess.WRITE];
  
  @override
  Future<void> initialize() async {
    await healthInstance.configure();
  }

  @override
  Future<bool> askForReadWritePermission() async {    
    return await healthInstance.requestAuthorization(types, permissions: permissions);
  }

  @override
  Future<void> writeHydrationData(double waterAmount, DateTime recordTime, String id) async {
    await healthInstance.writeHealthData(
      value: waterAmount, 
      type: HealthDataType.WATER,
      startTime: recordTime,
      endTime: recordTime.add(Duration(seconds: 1)),
      clientRecordId: id,
    );
  }

  @override
  Future<void> deleteHydrationData(String clientRecordId) async {
    await healthInstance.deleteByClientRecordId(
      dataTypeKey: HealthDataType.WATER, 
      clientRecordId: clientRecordId
    );
  }

  @override
  Future<void> revokePermissions() async {
    await healthInstance.revokePermissions();
  }

  @override
  Future<bool> hasPermissions() async {
    return await healthInstance.hasPermissions(types, permissions: permissions) ?? false;
  }

}