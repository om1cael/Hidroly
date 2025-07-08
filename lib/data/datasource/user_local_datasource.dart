import 'package:hidroly/data/model/day.dart';

abstract class DayLocalDataSource {
  Future<void> createUser(Day user);
  Future<void> updateUser(Day user);
  Future<Day?> getUser(int userId);
}