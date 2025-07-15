import 'package:hidroly/data/model/day.dart';

abstract class DayLocalDataSource {
  Future<void> create(Day day);
  Future<void> update(Day day);
  Future<Day?> findFirst();
  Future<Day?> findLatest();
  Future<Day?> findByDate(DateTime date);
}