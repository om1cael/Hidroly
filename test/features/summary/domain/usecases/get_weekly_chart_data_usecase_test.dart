import 'package:easy_localization/easy_localization.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_weekly_chart_data_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../testing/repositories/mock_day_repository.dart';

void main() {
  late DayRepository dayRepository;
  late GetWeeklyChartDataUseCase useCase;

  setUp(() {
    dayRepository = MockDayRepository();
    useCase = GetWeeklyChartDataUseCase(dayRepository);
  });

  group('Get weekly chart data usecase tests', () {
    test(('Should group correctly by day'), () async {
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

      final daysMap = await useCase.execute(UnitSystem.metric);

      expect(daysMap[0]['period'], DateFormat.E().format(DateTime(2026, 1, 1)));
      expect(daysMap[1]['period'], DateFormat.E().format(DateTime(2026, 1, 2)));
    });

    test(('Should get correct amount for each day'), () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.zero(),
          createdAt: DateTime(2026, 1, 1),
        ),
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.zero(),
          createdAt: DateTime(2026, 1, 2),
        ),
      ]);

      final daysMap = await useCase.execute(UnitSystem.metric);

      expect(daysMap[0]['amount'], Water.zero().ml);
      expect(daysMap[1]['amount'], Water.zero().ml);
    });

    test(('Should ignore data from past week'), () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => []);

      await useCase.execute(UnitSystem.metric, baseDate: DateTime(2026, 1, 7));

      verify(() => dayRepository.readByRange(
        DateTime(2026, 1, 4), 
        DateTime(2026, 1, 7),
      )).called(1);
    });
  
    test(('Should not break on january 1'), () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => []);

      await useCase.execute(UnitSystem.metric, baseDate: DateTime(2026, 1, 1));

      verify(() => dayRepository.readByRange(
        DateTime(2025, 12, 28), 
        DateTime(2026, 1, 1),
      )).called(1);
    });

    test(('Should convert to oz'), () async {
      when(() => dayRepository.readByRange(any(), any())).thenAnswer((_) async => [
        Day(
          dailyGoal: Water.zero(), 
          currentAmount: Water.ml(300),
          createdAt: DateTime(2026, 1, 1),
        ),
      ]);

      final daysMap = await useCase.execute(UnitSystem.imperial);

      final amount = daysMap[0]['amount'];
      final oz = (300 / 29.574).round();

      expect(amount, oz);
    });
  });
}