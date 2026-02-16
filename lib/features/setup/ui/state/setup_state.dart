import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';

part 'setup_state.freezed.dart';

@freezed
abstract class SetupState with _$SetupState {
  const factory SetupState({
    required int age,
    required int weight,
    required Set<UnitSystem> unit,
    @Default(false) bool dailyGoalClamped,
  }) = _SetupState;
}

extension SetupStateX on SetupState {
  int get minWeight => unit.first == UnitSystem.metric
     ? SetupConstraints.minWeightKg
     : SetupConstraints.minWeightLb;

  int get maxWeight => unit.first == UnitSystem.metric
     ? SetupConstraints.maxWeightKg
     : SetupConstraints.maxWeightLb;
}