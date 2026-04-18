import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/summary/domain/usecases/get_streak_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../testing/repositories/mock_day_repository.dart';

void main() {
  late MockDayRepository dayRepository;
  late GetStreakUseCase useCase;

  setUp(() {
    dayRepository = MockDayRepository();
    useCase = GetStreakUseCase(dayRepository);
  });

  group('Get Streak UseCase tests', () {
    test('Should return a streak if daily goals were met', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
        _mockDay(2000),
        _mockDay(2000, subtractDays: 1),
        _mockDay(2000, subtractDays: 2),
      ]);

      final streak = await useCase.execute();

      expect(streak, 3);
    });

    test('Should count if amount is greater than daily goal', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
        _mockDay(2500),
        _mockDay(2001, subtractDays: 1),
      ]);

      final streak = await useCase.execute();

      expect(streak, 2);
    });

    test('Should not lose streak if today\'s goal is not yet met', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
        _mockDay(1500),
        _mockDay(2000, subtractDays: 1),
        _mockDay(2000, subtractDays: 2),
      ]);

      final streak = await useCase.execute();

      expect(streak, 2);
    });

    test('Should return 0 if there is a gap in the days (yesterday missed)', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => [
        _mockDay(1500),
        _mockDay(2500, subtractDays: 2),
      ]);

      final streak = await useCase.execute();

      expect(streak, 0);
    });

    test('Should return 0 if day list is empty', () async {
      when(() => dayRepository.readAll()).thenAnswer((_) async => []);
      
      final streak = await useCase.execute();

      expect(streak, 0);
    });
  });
}

Day _mockDay(int ml, {int subtractDays = 0}) => Day(
  dailyGoal: Water.ml(2000),
  currentAmount: Water.ml(ml),
  createdAt: subtractDays > 0 ? DateTime.now().subtract(Duration(days: subtractDays)) : DateTime.now(),
);