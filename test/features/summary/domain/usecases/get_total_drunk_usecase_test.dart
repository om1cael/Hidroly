import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_total_drunk_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../testing/repositories/mock_day_repository.dart';

void main() {
  late MockDayRepository dayRepository;
  late GetTotalDrunkUseCase useCase;

  setUp(() {
    dayRepository = MockDayRepository();
    useCase = GetTotalDrunkUseCase(dayRepository);
  });

  group('Get Total Drunk UseCase tests', () {
    test('Returns 0 if day list is empty', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => []);
      
      final totalDrunk = await useCase.execute();

      expect(totalDrunk, 0);
    });

    test('Should return correctly the sum of all days', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(2000), createdAt: DateTime.now()),
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(1500), createdAt: DateTime.now()),
          Day(dailyGoal: Water.ml(2000), currentAmount: Water.ml(1600), createdAt: DateTime.now()),
        ]
      );

      final dailyAverage = await useCase.execute();

      expect(dailyAverage, 5100);
    });
  });
}