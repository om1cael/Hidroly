import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_connect_backfill_state.freezed.dart';

@freezed
abstract class HealthConnectBackfillState with _$HealthConnectBackfillState {
  const factory HealthConnectBackfillState.idle() = _Idle;
  const factory HealthConnectBackfillState.processing() = _Processing;
  const factory HealthConnectBackfillState.error() = _Error;
}