import 'package:hidroly/data/datasource/day_local_datasource_impl.dart';
import 'package:hidroly/data/model/day.dart';

class DayRepository {
  final DayLocalDataSourceImpl _userLocalDataSourceImpl;

  const DayRepository(this._userLocalDataSourceImpl);

  Future<void> create(Day user) async => await _userLocalDataSourceImpl.create(user);

  Future<Day?> read(int id) async => await _userLocalDataSourceImpl.read(1);
  
  Future<void> update(Day updatedUser) async => await _userLocalDataSourceImpl.update(updatedUser);
}