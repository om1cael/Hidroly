import 'package:hidroly/model/water_button.dart';

abstract class CustomCupsLocalDataSource {
  Future<void> createCustomCup(WaterButton waterButton);
  Future<List<WaterButton>> getAllCustomCups();
}