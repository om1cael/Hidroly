import 'package:easy_localization/easy_localization.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_yearly_chart_data_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../testing/repositories/mock_day_repository.dart';

void main() {
  late DayRepository dayRepository;
  late GetYearlyChartDataUsecase useCase;

  setUp(() {
    dayRepository = MockDayRepository();
    useCase = GetYearlyChartDataUsecase(dayRepository);
  });

  group('Get Yearly chart data usecase tests', () {
    test(('Should group correctly by month'), () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 1),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 2),
        ),
      ]);

      final yearlyMap = await useCase.execute(UnitSystem.metric);
      expect(yearlyMap[0]['period'], DateFormat.LLL().format(DateTime(2026, 1, 1)));
    });

    test('Should group correctly when there are multiple months', () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 2),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 2, 1),
        ),
      ]);

      final yearlyMap = await useCase.execute(UnitSystem.metric);
      expect(yearlyMap[0]['period'], DateFormat.LLL().format(DateTime(2026, 1, 1)));
      expect(yearlyMap[1]['period'], DateFormat.LLL().format(DateTime(2026, 2, 1)));
    });

    test('Should only return months that have data', () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 2),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 3, 1),
        ),
      ]);

      final yearlyMap = await useCase.execute(UnitSystem.metric);

      expect(yearlyMap.length, 2);
      expect(yearlyMap[0]['period'], DateFormat.LLL().format(DateTime(2026, 1, 1)));
      expect(yearlyMap[1]['period'], DateFormat.LLL().format(DateTime(2026, 3, 1)));
    });

    test('Should return the sum of all days in a month', () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.ml(300),
          createdAt: DateTime(2026, 1, 1),
        ),
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.ml(300),
          createdAt: DateTime(2026, 1, 2),
        ),
      ]);

      final yearlyMap = await useCase.execute(UnitSystem.metric);
      final amount = Water.ml(yearlyMap[0]['amount']);

      expect(amount.ml, 600);
    });

    test('Should return correct oz value', () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.ml(300),
          createdAt: DateTime(2026, 1, 1),
        ),
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.ml(300),
          createdAt: DateTime(2026, 1, 2),
        ),
      ]);

      final yearlyMap = await useCase.execute(UnitSystem.imperial);
      final amount = yearlyMap[0]['amount'];

      final oz = (600 / 29.574).round();
      expect(amount, oz);
    });
  });
}