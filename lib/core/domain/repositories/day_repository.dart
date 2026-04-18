import 'package:hidroly/core/domain/entities/day.dart';

abstract class DayRepository {
  Future<int> save(Day day);
  Future<Day> read(int id);
  Future<List<Day>> readAll();
  Future<List<Day>> readByRange(DateTime start, DateTime end);
  Future<Day> readOrCreateByDate(DateTime date);
}