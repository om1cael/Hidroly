import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';

class HomeController {
  User? user;
  List<WaterButton>? customCups = [];

  Future<void> loadUser() async {
    user = await DatabaseHelper.instance.getUser(1);
  }
  
  Future<void> updateUser(User updatedUser) async {
    await DatabaseHelper.instance.updateUser(updatedUser);
    await loadUser();
  }

  Future<void> loadCustomCups() async {
    customCups = await DatabaseHelper.instance.getAllCustomCups();
  }
}