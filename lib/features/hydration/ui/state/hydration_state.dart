import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';

part 'hydration_state.freezed.dart';

@freezed
abstract class HydrationState with _$HydrationState {
  const factory HydrationState({
    required Day day,
    required List<Cup> cups,
    @Default(UnitSystem.metric) UnitSystem unitSystem,
  }) = _HydrationState;
}