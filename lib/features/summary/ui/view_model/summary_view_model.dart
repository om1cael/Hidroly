import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_daily_average_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_monthly_chart_data_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_streak_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_total_drunk_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_weekly_chart_data_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_yearly_chart_data_usecase.dart';
import 'package:hidroly/features/summary/ui/enums/chart_selection.dart';
import 'package:hidroly/features/summary/ui/state/summary_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'summary_view_model.g.dart';

@riverpod
class SummaryViewModel extends _$SummaryViewModel {
  @override
  Future<SummaryState> build() async {
    final (totalDrunk, dailyAverage, streak, weeklyChartData) = await (
      ref.read(getTotalDrunkUseCaseProvider).execute(),
      ref.read(getDailyAverageUseCaseProvider).execute(),
      ref.read(getStreakUseCaseProvider).execute(),
      ref.read(getWeeklyChartDataUseCaseProvider).execute(),
    ).wait;

    final unitSystem = 
      await ref.watch(settingsRepositoryProvider).readUnitSystem();
    
    return SummaryState(
      totalDrunk: Water.ml(totalDrunk),
      dailyAverage: Water.ml(dailyAverage),
      streak: streak,
      unitSystem: unitSystem,
      chartData: weeklyChartData,
    );
  }

  void updateChartSelection(ChartSelection chartSelection) async {
    state = await AsyncValue.guard(() async {
      final currentState = state.requireValue;
      List<Map<String, dynamic>> chartData;

      switch(chartSelection) {
        case .monthly:
          chartData = await ref.read(getMonthlyChartDataUseCaseProvider).execute();
          break;
        case .yearly:
          chartData = await ref.read(getYearlyChartDataUsecaseProvider).execute();
          break;
        default: 
          chartData = await ref.read(getWeeklyChartDataUseCaseProvider).execute();
      }

      return currentState.copyWith(
        chartSelection: chartSelection,
        chartData: chartData,
      );
    });
  }
}