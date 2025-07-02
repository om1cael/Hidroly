import 'package:hidroly/model/user.dart';

abstract class UserLocalDataSource {
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<User?> getUser(int userId);
}