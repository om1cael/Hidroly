import 'package:hidroly/core/domain/exceptions/app_exception.dart';

class UnsupportedDatabaseException extends AppException {
  const UnsupportedDatabaseException(String? message) : super(message ?? '');
  
  @override
  String toString() => 'UnsupportedDatabaseException: $message';
}