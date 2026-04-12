import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:test/test.dart';

void main() {
  group("Water Value Object tests", () {
    test('Should accept within boundary', () {
      expect(Water.ml(350), isA<Water>());
    });

    test('Throws error if value is outside boundary', () {
      expect(() => Water.ml(Water.minValue - 1), throwsA(isA<InvalidInputException>()));
    });

    test('valueIn returns correct value based on unitSystem', () {
      final water = Water.ml(300);
      final ozValue = (water.ml / 29.574).round();

      expect(water.valueIn(UnitSystem.metric), 300);
      expect(water.valueIn(UnitSystem.imperial), ozValue);
    });
  });
}