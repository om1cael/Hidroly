import 'package:easy_localization/easy_localization.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
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
  
  Future<List<Map<String, dynamic>>> execute(UnitSystem unitSystem) async {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final weekDay = normalizedToday.weekday;
    final firstWeekDay = normalizedToday.subtract(Duration(days: weekDay));

    final days = await _dayRepository.readByRange(firstWeekDay, normalizedToday);
    
    return List.generate(days.length, (index) {
      final day = days[index];
      final weekDayAbbr = _getLocalizedDayAbbr(day.createdAt);

      return {'period': weekDayAbbr, 'amount': day.currentAmount.valueIn(unitSystem)};
    });
  }

  String _getLocalizedDayAbbr(DateTime date) {
    return DateFormat.E().format(date);
  }
}