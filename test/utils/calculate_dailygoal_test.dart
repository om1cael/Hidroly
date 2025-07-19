import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

void main() {
  final dailyGoal = CalculateDailyGoal();
  final weightInKg = 70;

  group('Test daily goal calculation for multiple age groups', () {
    test('< 17 uses 40ml per kg', () {
      final value = dailyGoal.calculate(16, weightInKg);
      expect(value, 2800);
    });

    test('< 55 uses 35ml per kg', () {
      final value = dailyGoal.calculate(50, weightInKg);
      expect(value, 2450);
    });

    test('< 66 uses 30ml per kg', () {
      final value = dailyGoal.calculate(65, weightInKg);
      expect(value, 2100);
    });

    test('> 65 uses 25ml per kg', () {
      final value = dailyGoal.calculate(70, weightInKg);
      expect(value, 1750);
    });
  });

  group('Boundary values for age groups', () {
    test('== 17 uses 40ml per kg', () {
      final value = dailyGoal.calculate(17, weightInKg);
      expect(value, 2800);
    });

    test('== 18 uses 35ml per kg', () {
      final value = dailyGoal.calculate(18, weightInKg);
      expect(value, 2450);
    });

    test('== 55 uses 30ml per kg', () {
      final value = dailyGoal.calculate(55, weightInKg);
      expect(value, 2100);
    });

    test('== 66 uses 25ml per kg', () {
      final value = dailyGoal.calculate(66, weightInKg);
      expect(value, 1750);
    });
  });
}