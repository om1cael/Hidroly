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
    
    return SummaryState(
      totalDrunk: results[0],
      dailyAverage: results[1],
      streak: results[2],
    );
  }
}