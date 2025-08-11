import 'package:hidroly/data/model/water_button.dart';

abstract class CustomCupsLocalDataSource {
  Future<void> createCustomCup(WaterButton waterButton);
  Future<List<WaterButton>> getAllCustomCups();
  Future<void> updateCustomCup(WaterButton waterButton);
  Future<void> deleteCustomCup(int id);
}