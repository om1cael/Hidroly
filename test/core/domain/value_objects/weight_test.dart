import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';

void main() {
  group('Weight Value Object Testing', () {
    final minWeight = Weight.minWeight;
    final maxWeight = Weight.maxWeight;

    final minWeightLb = Weight.minWeightLb;
    final maxWeightLb = Weight.maxWeightLb;

    test('Accepts withing range', () {
      expect(Weight.kg(minWeight), isA<Weight>());
      expect(Weight.kg(maxWeight), isA<Weight>());
    });

    test('Rejects out of range', () {
      expect(() => Weight.kg(minWeight - 1), throwsA(isA<InvalidInputException>()));
      expect(() => Weight.kg(maxWeight + 1), throwsA(isA<InvalidInputException>()));
    });

    test('Correctly converts from lb to kg', () {
      final lbWeight = 143;
      final expectedKg = 65;

      expect(Weight.fromLb(lbWeight).kg, equals(expectedKg));
    });

    test('Rejects out of range lb conversion', () {
      // This is needed because the code rounds the conversion.
      final testFailureRange = 5;

      expect(() => Weight.fromLb(minWeightLb - testFailureRange), throwsA(isA<InvalidInputException>()));
      expect(() => Weight.fromLb(maxWeightLb + testFailureRange), throwsA(isA<InvalidInputException>()));
    });

    test('Gets correct value based on the unit system', () {
      expect(Weight.minWeightFor(UnitSystem.metric), equals(minWeight));
      expect(Weight.maxWeightFor(UnitSystem.metric), equals(maxWeight));

      expect(Weight.minWeightFor(UnitSystem.imperial), equals(minWeightLb));
      expect(Weight.maxWeightFor(UnitSystem.imperial), equals(maxWeightLb));
    });
  });
}