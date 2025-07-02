import 'package:hidroly/data/datasource/user_local_datasource_impl.dart';
import 'package:hidroly/data/model/user.dart';

class UserRepository {
  final UserLocalDataSourceImpl _userLocalDataSourceImpl;

  const UserRepository(this._userLocalDataSourceImpl);

  Future<User?> loadUser(int id) async => await _userLocalDataSourceImpl.getUser(1);
  
  Future<void> updateUser(User updatedUser) async => await _userLocalDataSourceImpl.updateUser(updatedUser);
}