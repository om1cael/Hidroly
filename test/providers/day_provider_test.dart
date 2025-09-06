import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockDayRepository extends Mock implements DayRepository {}

void main() {
  late DayProvider provider;
  late MockDayRepository mockDayRepository;
  late Day day;

  final currentAmount = 600;

  setUpAll(() {
    registerFallbackValue(Day(
      dailyGoal: 2000, 
      date: DateTime.now().toUtc()
    ));
  });

  setUp(() {
    provider = DayProvider();
    mockDayRepository = MockDayRepository();
    provider.setRepository(mockDayRepository);

    day = Day(
      currentAmount: currentAmount, 
      dailyGoal: 2000, 
      date: DateTime.now().toUtc()
    );
  });

  group("Test water addition", () {
    test('Should add if day all conditions met', () async {
      when(() => mockDayRepository.update(any()))
        .thenAnswer((_) async {});

      provider.day = day;
      expect(await provider.addWater(100), true);
      verify(() => mockDayRepository.update(any())).called(1);
    });

    test('Current amount is updating after adding', () async {
      when(() => mockDayRepository.update(any()))
        .thenAnswer((_) async {});

      provider.day = day;
      expect(await provider.addWater(100), true);
      verify(() => mockDayRepository.update(any())).called(1);

      expect(provider.day!.currentAmount, currentAmount + 100);
    });

    test('Should not add if day is null', () async {
      provider.day = null;
      expect(await provider.addWater(100), false);
    });
  });

  group("Test water remove", () {
    test('Should remove if all conditions met', () async {
      when(() => mockDayRepository.update(any()))
        .thenAnswer((_) async {});

      provider.day = day;
      expect(await provider.removeWater(300), true);
      verify(() => mockDayRepository.update(any())).called(1);
    });

    test('Current amount is updating after removing', () async {
      when(() => mockDayRepository.update(any()))
        .thenAnswer((_) async {});

      provider.day = day;
      expect(await provider.removeWater(100), true);
      verify(() => mockDayRepository.update(any())).called(1);

      expect(provider.day!.currentAmount, currentAmount - 100);
    });

    test('Should not remove if day is null', () async {
      provider.day = null;
      expect(await provider.removeWater(100), false);
    });

    test('Should not remove if current amount is lower than argument', () async {
      provider.day = day;
      expect(await provider.removeWater(currentAmount + 100), false);
    });

    test('Should not remove if argument amount is lower than or equals to zero', () async {
      provider.day = day;
      expect(await provider.removeWater(0), false);
      expect(await provider.removeWater(-1), false);
    });
  });
}