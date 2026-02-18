import 'package:hidroly/core/domain/entities/day.dart';

abstract class DayRepository {
  Future<int> save(Day day);
}