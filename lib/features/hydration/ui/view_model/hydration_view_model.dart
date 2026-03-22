import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/features/hydration/data/repositories/cup_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';
import 'package:hidroly/features/hydration/ui/state/hydration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydration_view_model.g.dart';

@riverpod
class HydrationViewModel extends _$HydrationViewModel {
  @override
  Future<HydrationState> build() async {
    final dayRepository = ref.watch(dayRepositoryProvider);
    final settingsRepository = ref.watch(settingsRepositoryProvider);

    final day = await dayRepository.read(1);
    final unitSystem = await settingsRepository.readUnitSystem();

    return HydrationState(day: day!, unitSystem: unitSystem);
  }

  Future<void> createCup(String value) async {
    final cupRepository = ref.read(cupRepositoryProvider);
    final cupValue = _getCupValue(int.parse(value));

    await cupRepository.save(state.requireValue.day.id, cupValue.value);
    ref.invalidateSelf();
  }

  InputStatus validateCupValue(String? cupValueText) {
    if(cupValueText == null || cupValueText.isEmpty) {
      return .noInput;
    }

    try {
      final cupValue = int.tryParse(cupValueText) ?? 0;
      _getCupValue(cupValue);

      return .success;
    } on InvalidInputException {
      return .outOfBoundaries;
    }
  }

  CupValue _getCupValue(int cupValue) {
    return state.requireValue.unitSystem == UnitSystem.metric
      ? CupValue.ml(cupValue)
      : CupValue.fromOz(cupValue);
  }
}