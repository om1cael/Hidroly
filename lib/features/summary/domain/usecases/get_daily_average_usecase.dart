import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_daily_average_usecase.g.dart';

@riverpod
GetDailyAverageUseCase getDailyAverageUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return GetDailyAverageUseCase(dayRepository);
}

class GetDailyAverageUseCase {
  final DayRepository _dayRepository;

  const GetDailyAverageUseCase(this._dayRepository);

  Future<int> execute() async {
    final dayList = await _dayRepository.readAll();

    if (dayList.isEmpty) return 0;

    final totalDrunk = dayList.fold(
      0,
      (previousValue, day) => previousValue + day.currentAmount.ml,
    );

    final average = totalDrunk ~/ dayList.length;
    return average;
  }
}
