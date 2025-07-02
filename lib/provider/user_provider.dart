import 'package:flutter/widgets.dart';
import 'package:hidroly/data/model/user.dart';
import 'package:hidroly/data/repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
  UserRepository? _userRepository;

  User? _user;
  User? get user => _user;


  void setRepository(UserRepository repository) {
    _userRepository = repository;
  }

  Future<void> loadUser(int id) async {
    _user = await _userRepository!.loadUser(id);
    notifyListeners();
  }
  
  Future<void> updateUser(User updatedUser) async {
    await _userRepository!.updateUser(updatedUser);
    await loadUser(updatedUser.id);
  }

  Future<void> addWater(int amount) async {
    User updatedUser = _user!.copyWith(
      currentAmount: _user!.currentAmount + amount,
    );

    await updateUser(updatedUser);
  }
}