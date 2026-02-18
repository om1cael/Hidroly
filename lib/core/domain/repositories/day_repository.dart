import 'package:hidroly/core/domain/entities/day.dart';

abstract class DayRepository {
  void save(Day day);
}