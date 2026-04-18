import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_daily_average_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../testing/repositories/mock_day_repository.dart';

void main() {
  late MockDayRepository dayRepository;
  late GetDailyAverageUseCase useCase;

  setUp(() {
    dayRepository = MockDayRepository();
    useCase = GetDailyAverageUseCase(dayRepository);
  });

  group('Get Daily Average UseCase Tests', () {
    test('Returns 0 if day list is empty', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => []);
      
      final dailyAverage = await useCase.execute();

      expect(dailyAverage, 0);
    });

    test('Returns correct average with multiple days', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(2000), createdAt: DateTime.now()),
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(1500), createdAt: DateTime.now()),
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(1600), createdAt: DateTime.now()),
        ]
      );

      final dailyAverage = await useCase.execute();

      expect(dailyAverage, 1700);
    });

    test('Division is rounded', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(1000), createdAt: DateTime.now()),
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(1000), createdAt: DateTime.now()),
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(500), createdAt: DateTime.now()),
        ]
      );

      final dailyAverage = await useCase.execute();

      // 2500/3 = 833.333...
      expect(dailyAverage, 833);
    });
  });
}