import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/ui/enums/chart_selection.dart';

part 'summary_state.freezed.dart';

@freezed
abstract class SummaryState with _$SummaryState {
  const factory SummaryState({
    @Default(Water.zero()) Water totalDrunk,
    @Default(Water.zero()) Water dailyAverage,
    @Default(0) int streak,
    @Default(UnitSystem.metric) UnitSystem unitSystem,
    @Default(ChartSelection.weekly) ChartSelection chartSelection,
    required List<Map<String, dynamic>> chartData,
  }) = _SummaryState;
}