import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/entities/day.dart';

part 'hydration_state.freezed.dart';

@freezed
abstract class HydrationState with _$HydrationState {
  const factory HydrationState({
    required Day day,
  }) = _HydrationState;
}