import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_daily_average_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_streak_usecase.dart';
import 'package:hidroly/features/summary/domain/usecases/get_total_drunk_usecase.dart';
import 'package:hidroly/features/summary/ui/state/summary_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'summary_view_model.g.dart';

@riverpod
class SummaryViewModel extends _$SummaryViewModel {
  @override
  Future<SummaryState> build() async {
    final results = await Future.wait([
      ref.read(getTotalDrunkUseCaseProvider).execute(),
      ref.read(getDailyAverageUseCaseProvider).execute(),
      ref.read(getStreakUseCaseProvider).execute(),
    ]);

    final unitSystem = 
      await ref.watch(settingsRepositoryProvider).readUnitSystem();
    
    return SummaryState(
      totalDrunk: Water.ml(results[0]),
      dailyAverage: Water.ml(results[1]),
      streak: results[2],
      unitSystem: unitSystem,
    );
  }
}