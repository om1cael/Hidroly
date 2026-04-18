import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/providers/unit_system_provider.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/features/hydration/data/repositories/cup_repository_impl.dart';
import 'package:hidroly/features/hydration/data/repositories/history_item_repository_impl.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';
import 'package:hidroly/features/hydration/ui/state/hydration_state.dart';
import 'package:result_dart/result_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydration_view_model.g.dart';

// TODO: break build into smaller providers
@riverpod
class HydrationViewModel extends _$HydrationViewModel {
  @override
  Future<HydrationState> build() async {
    final selectedDate = ref.watch(selectedDateProvider);

    final dayRepository = ref.watch(dayRepositoryProvider);
    final historyRepository = ref.watch(historyItemRepositoryProvider);
    final cupRepository = ref.watch(cupRepositoryProvider);
    final unitSystem = await ref.watch(unitSystemProviderProvider.future);

    final day = await dayRepository.readOrCreateByDate(selectedDate);
    final history = await historyRepository.readAll(day.id);
    final cups = await cupRepository.readAll();

    return HydrationState(day: day, history: history, unitSystem: unitSystem, cups: cups);
  }

  Future<void> createCup(String value) async {
    final cupRepository = ref.read(cupRepositoryProvider);
    final cupValue = _getCupValue(int.parse(value));

    await cupRepository.save(cupValue.value);
    ref.invalidateSelf();
  }

  Future<void> deleteCup(int id) async {
    final cupRepository = ref.read(cupRepositoryProvider);

    final result = await cupRepository.delete(id);
    
    if(result is Success) {
      ref.invalidateSelf();
    }
  }

  Future<void> loadByDate(DateTime date) async {
    ref.read(selectedDateProvider.notifier).update(date);
  }

  Future<Day> getFirstDay() async {
    final dayRepository = ref.read(dayRepositoryProvider);
    final day = await dayRepository.read(1);

    return day;
  }

  Future<void> addWater(int amount) async {
    final hydrationRepository = ref.read(hydrationRepositoryProvider);

    await hydrationRepository.addWater(state.requireValue.day.id, amount);
    ref.invalidateSelf();
  }

  Future<void> removeWater(int historyItemId, int amount) async {
    final hydrationRepository = ref.read(hydrationRepositoryProvider);

    await hydrationRepository.removeWater(state.requireValue.day.id, historyItemId, amount);
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

@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  DateTime build() => DateTime.now();

  void update(DateTime date) => state = date;
}