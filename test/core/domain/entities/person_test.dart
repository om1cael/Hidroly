import 'package:hidroly/core/domain/entities/person.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:test/test.dart';

void main() {
  group('Person Entity Tests', () {
    test('Returns correct ml/kg for each age range', () {
      final weight = Weight.kg(70);
      
      expect(Person(age: Age(17), weight: weight).calculateHydrationGoalMl().rawDailyGoal, equals(2800)); // 40ml/kg
      expect(Person(age: Age(25), weight: weight).calculateHydrationGoalMl().rawDailyGoal, equals(2450)); // 35ml/kg
      expect(Person(age: Age(60), weight: weight).calculateHydrationGoalMl().rawDailyGoal, equals(2100)); // 30ml/kg
      expect(Person(age: Age(70), weight: weight).calculateHydrationGoalMl().rawDailyGoal, equals(1750)); // 25ml/kg
    });

    test('Does not clamp goal if not necessary', () {
      final person = Person(age: Age(25), weight: Weight.kg(60));
      expect(person.calculateHydrationGoalMl().isClamped, equals(false));
    });

    test('Clamps goal if it exceeds the constraint value', () {
      final person = Person(age: Age(25), weight: Weight.kg(150));
      expect(person.calculateHydrationGoalMl().isClamped, equals(true));
    });
  });
}