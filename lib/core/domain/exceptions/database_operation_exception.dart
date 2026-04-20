import 'package:hidroly/core/domain/exceptions/app_exception.dart';

class DatabaseOperationException extends AppException {
  const DatabaseOperationException([String? message]) : super(message ?? '');

  @override
  String toString() => 'DatabaseOperationException: $message';
}