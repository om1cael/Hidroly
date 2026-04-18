import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_monthly_chart_data_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../testing/repositories/mock_day_repository.dart';

void main() {
  late DayRepository dayRepository;
  late GetMonthlyChartDataUsecase useCase;

  setUp(() {
    dayRepository = MockDayRepository();
    useCase = GetMonthlyChartDataUsecase(dayRepository);
  });

  group('Get monthly chart data usecase tests', () {
    test(('Should group correctly by week'), () async {
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

      final monthlyMap = await useCase.execute(UnitSystem.metric);
      expect(monthlyMap[0]['period'], '1');
    });

    test('Should group correctly when there are multiple weeks', () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 1),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 2),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 7),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 8),
        ),
      ]);

      final monthlyMap = await useCase.execute(UnitSystem.metric);

      expect(monthlyMap.length, 2);
      expect(monthlyMap[0]['period'], '1');
      expect(monthlyMap[1]['period'], '2');
    });

    test('Should skip week if it doesn\'t have data', () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 1),
        ),
        Day(
          dailyGoal: Water.zero(), 
          createdAt: DateTime(2026, 1, 15),
        ),
      ]);

      final monthlyMap = await useCase.execute(UnitSystem.metric);

      expect(monthlyMap.length, 2);
      expect(monthlyMap[0]['period'], '1');
      expect(monthlyMap[1]['period'], '3');
    });

    test('Should return the sum of all days in a week', () async {
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

      final monthlyMap = await useCase.execute(UnitSystem.metric);
      final amount = Water.ml(monthlyMap[0]['amount']);

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

      final monthlyMap = await useCase.execute(UnitSystem.imperial);
      final amount = monthlyMap[0]['amount'];

      final oz = (600 / 29.574).round();
      expect(amount, oz);
    });
  });
}