import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';

void main() {
  group('Weight Value Object Testing', () {
    final minWeight = Weight.minWeight;
    final maxWeight = Weight.maxWeight;

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
  });
}