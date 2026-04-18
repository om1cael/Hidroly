import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_weekly_chart_data_usecase.g.dart';

@riverpod
GetWeeklyChartDataUseCase getWeeklyChartDataUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return GetWeeklyChartDataUseCase(dayRepository);
}

class GetWeeklyChartDataUseCase {
  final DayRepository _dayRepository;

  const GetWeeklyChartDataUseCase(this._dayRepository);
  
  Future<List<Map<String, dynamic>>> execute() async {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final weekDay = normalizedToday.day % 7;
    final firstWeekDay = normalizedToday.subtract(Duration(days: weekDay));

    final days = await _dayRepository.readByRange(firstWeekDay, normalizedToday);
    
    return List.generate(days.length, (index) {
      final day = days[index];
      print(day);
      return {'period': day.createdAt.day.toString(), 'amount': day.currentAmount.ml};
    });
  }
}