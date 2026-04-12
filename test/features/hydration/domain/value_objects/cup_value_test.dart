import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';
import 'package:test/test.dart';

void main() {
  group("Cup Value tests", () {
    test('Should accept within boundaries', () {
      expect(CupValue.ml(350), isA<CupValue>());
    });

    test('Should accept exact boundary values', () {
      expect(CupValue.ml(CupValue.minValue).value, CupValue.minValue);
      expect(CupValue.ml(CupValue.maxValue).value, CupValue.maxValue);
    });

    test('Throws error if value is outside boundaries', () {
      expect(() => CupValue.ml(CupValue.minValue - 1), throwsA(isA<InvalidInputException>()));
      expect(() => CupValue.ml(CupValue.maxValue + 1), throwsA(isA<InvalidInputException>()));
    });

    test('Converts from oz to ml', () {
      final oz = 8;
      final ml = (oz * 29.574).round();

      final cupValue = CupValue.fromOz(oz);
      expect(cupValue.value, ml);
    });
  });
}