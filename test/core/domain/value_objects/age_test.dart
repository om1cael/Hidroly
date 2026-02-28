import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';

void main() {
  group('Age Value Object Testing', () {
    final minAge = Age.minAge;
    final maxAge = Age.maxAge;

    test('Accepts withing range', () {
      expect(Age(minAge), isA<Age>());
      expect(Age(maxAge), isA<Age>());
    });

    test('Rejects out of range', () {
      expect(() => Age(minAge - 1), throwsA(isA<InvalidInputException>()));
      expect(() => Age(maxAge + 1), throwsA(isA<InvalidInputException>()));
    });
  });
}