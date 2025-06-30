import 'package:flutter/widgets.dart';
import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<void> loadUser() async {
    _user = await DatabaseHelper.instance.getUser(1);
    notifyListeners();
  }
  
  Future<void> updateUser(User updatedUser) async {
    await DatabaseHelper.instance.updateUser(updatedUser);
    await loadUser();
  }

  Future<void> addWater(int amount) async {
    User updatedUser = _user!.copyWith(
      currentAmount: _user!.currentAmount + amount,
    );

    await updateUser(updatedUser);
  }
}