import 'package:flutter/widgets.dart';
import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;

  Future<void> loadUser() async {
    user = await DatabaseHelper.instance.getUser(1);
    notifyListeners();
  }
  
  Future<void> updateUser(User updatedUser) async {
    await DatabaseHelper.instance.updateUser(updatedUser);
    await loadUser();
  }
}