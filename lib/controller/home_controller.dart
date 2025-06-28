import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';

class HomeController {
  Future<User?> loadUser() async {
    return await DatabaseHelper.instance.getUser(1);
  }

  Future<List<WaterButton>> loadCustomCups() async {
    return await DatabaseHelper.instance.getAllCustomCups();
  }
}