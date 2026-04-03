import 'package:hidroly/core/domain/entities/day.dart';

abstract class DayRepository {
  Future<int> save(Day day);
  Future<Day?> read(int id);
  Future<Day> readOrCreateByDate(DateTime date);
}