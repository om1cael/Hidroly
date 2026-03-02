import 'package:freezed_annotation/freezed_annotation.dart';

part 'hydration_goal.freezed.dart';

@freezed
class HydrationGoal with _$HydrationGoal {
  const HydrationGoal({
    required this.rawDailyGoal,
    required this.clampedGoal,
  });

  @override final int rawDailyGoal;
  @override final int clampedGoal;

  bool get isClamped => rawDailyGoal != clampedGoal;
}