import 'package:hidroly/features/setup/domain/exceptions/invalid_input_exception.dart';

class Age {
  final int value;

  const Age._internal(this.value);

  factory Age(int age) {
    if(age < minAge || age > maxAge) {
      throw InvalidInputException();
    }

    return Age._internal(age);
  }

  static const int minAge = 13;
  static const int maxAge = 100;
}