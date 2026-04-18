import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_streak_usecase.g.dart';

@riverpod
GetStreakUseCase getStreakUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return GetStreakUseCase(dayRepository);
}

class GetStreakUseCase {
  final DayRepository _dayRepository;

  const GetStreakUseCase(this._dayRepository);

  Future<int> execute() async {
    final dayList = await _dayRepository.readAll();
    int streak = 0;

    if (dayList.isEmpty) return streak;

    final today = DateTime.now();
    DateTime expectedDate = DateTime(today.year, today.month, today.day);

    for(final day in dayList) {
      final dayDate = DateTime(day.createdAt.year, day.createdAt.month, day.createdAt.day);

      if(dayDate == expectedDate) {
        if(day.currentAmount.ml >= day.dailyGoal.ml) {
          expectedDate = expectedDate.subtract(Duration(days: 1));
          streak++;
        } else {
          if(dayDate == DateTime(today.year, today.month, today.day)) {
            expectedDate = expectedDate.subtract(Duration(days: 1));
            continue;
          }

          break;
        }
      } else if(dayDate.isBefore(expectedDate)) {
        break;
      }
    }

    return streak;
  }
}
