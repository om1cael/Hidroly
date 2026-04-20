import 'package:hidroly/core/domain/exceptions/app_exception.dart';

class InvalidInputException extends AppException {
  const InvalidInputException([String? message]) : super(message ?? '');

  @override
  String toString() => 'InvalidInputException: $message';
}