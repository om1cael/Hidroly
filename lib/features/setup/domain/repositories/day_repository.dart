import 'package:hidroly/features/setup/domain/entities/day.dart';

abstract class DayRepository {
  void save(Day day);
}