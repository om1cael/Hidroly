import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

part 'hydration_form_state.freezed.dart';

@freezed
abstract class HydrationFormState with _$HydrationFormState {
  const factory HydrationFormState({
    required Set<UnitSystem> unit,
  }) = _HydrationFormState;
}