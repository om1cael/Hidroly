import 'package:collection/collection.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_monthly_chart_data_usecase.g.dart';

@riverpod
GetMonthlyChartDataUsecase getMonthlyChartDataUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return GetMonthlyChartDataUsecase(dayRepository);
}

class GetMonthlyChartDataUsecase {
  final DayRepository _dayRepository;

  const GetMonthlyChartDataUsecase(this._dayRepository);
  
  Future<List<Map<String, dynamic>>> execute(UnitSystem unitSystem) async {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final firstMonthDay = DateTime(today.year, today.month, 1);

    final days = await _dayRepository.readByRange(firstMonthDay, normalizedToday);

    final weekGroups = groupBy(days, (Day day) {
      final createdAtDay = day.createdAt.day;
      final week = ((createdAtDay - 1) / 7).floor() + 1;
      return week;
    });
    
    return weekGroups.entries.map((entry) {
      final week = entry.key;
      final days = entry.value;

      final weekSum = days.fold(0, (prev, currentDay) => prev + currentDay.currentAmount.ml);

      return {'period': week.toString(), 'amount': Water.ml(weekSum).valueIn(unitSystem)};
    }).toList();
  }
}