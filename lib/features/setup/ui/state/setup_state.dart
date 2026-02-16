import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';

part 'setup_state.freezed.dart';

@freezed
abstract class SetupState with _$SetupState {
  const factory SetupState({
    required int age,
    required int weight,
    required UnitSystem unit,
  }) = _SetupState;
}