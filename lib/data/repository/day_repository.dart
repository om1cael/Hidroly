import 'package:hidroly/data/datasource/day_local_datasource_impl.dart';
import 'package:hidroly/data/model/day.dart';

class DayRepository {
  final DayLocalDataSourceImpl _userLocalDataSourceImpl;

  const DayRepository(this._userLocalDataSourceImpl);

  Future<void> createUser(Day user) async => await _userLocalDataSourceImpl.createUser(user);

  Future<Day?> loadUser(int id) async => await _userLocalDataSourceImpl.getUser(1);
  
  Future<void> updateUser(Day updatedUser) async => await _userLocalDataSourceImpl.updateUser(updatedUser);
}