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
  
  @override
  Future<void> initialize() async {
    await healthInstance.configure();
  }

  @override
  Future<void> askForReadWritePermission() async {
    final types = [HealthDataType.WATER];
    final permissions = [HealthDataAccess.READ_WRITE];
    
    await healthInstance.requestAuthorization(types, permissions: permissions);
  }

  @override
  Future<void> writeHydrationData(double waterAmount, DateTime recordTime) async {
    await healthInstance.writeHealthData(
      value: waterAmount, 
      type: HealthDataType.WATER,
      startTime: recordTime,
      endTime: recordTime.add(Duration(seconds: 1))
    );
  }

  @override
  Future<void> revokePermissions() async {
    await healthInstance.revokePermissions();
  }
}