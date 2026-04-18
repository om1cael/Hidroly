import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_yearly_chart_data_usecase.g.dart';

@riverpod
GetYearlyChartDataUsecase getYearlyChartDataUsecase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return GetYearlyChartDataUsecase(dayRepository);
}

class GetYearlyChartDataUsecase {
  final DayRepository _dayRepository;

  const GetYearlyChartDataUsecase(this._dayRepository);
  
  Future<List<Map<String, dynamic>>> execute(UnitSystem unitSystem, {DateTime? baseDate}) async {
    final today = baseDate ?? DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final firstYearDay = DateTime(today.year, 1, 1);

    final days = await _dayRepository.readByRange(firstYearDay, normalizedToday);

    final monthGroups = groupBy(days, (Day day) {
      return day.createdAt.month;
    });
    
    return monthGroups.entries.map((entry) {
      final month = entry.key;
      final days = entry.value;

      final monthSum = days.fold(0, (prev, currentDay) => prev + currentDay.currentAmount.ml);
      final monthAbbr = _getLocalizedMonthAbbr(DateTime(2026, month, 1));

      return {'period': monthAbbr, 'amount': Water.ml(monthSum).valueIn(unitSystem)};
    }).toList();
  }

  String _getLocalizedMonthAbbr(DateTime date) {
    return DateFormat.LLL().format(date);
  }
}