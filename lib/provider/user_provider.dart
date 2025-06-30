import 'package:flutter/widgets.dart';
import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  UserStatus _userStatus = UserStatus.loading;
  UserStatus get userStatus => _userStatus;

  Future<void> loadUser() async {
    _user = await DatabaseHelper.instance.getUser(1);

    if(user == null) {
      _userStatus = UserStatus.empty;
    } else {
      _userStatus = UserStatus.loaded;
    }

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
    notifyListeners();
  }
}

enum UserStatus {loading, loaded, empty}