import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/User.dart';

class HomeController {
  Future<User?> loadUser() async {
    return await DatabaseHelper.instance.getUser(1);
  }
}