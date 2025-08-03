import 'package:hidroly/data/datasource/custom_cups_local_datasource_impl.dart';
import 'package:hidroly/data/model/water_button.dart';

class CustomCupsRepository {
  final CustomCupsLocalDataSourceImpl _customCupsLocalDataSourceImpl;

  CustomCupsRepository(this._customCupsLocalDataSourceImpl);

  Future<void> createCustomCup(WaterButton waterButton) async => 
    _customCupsLocalDataSourceImpl.createCustomCup(waterButton);

  Future<List<WaterButton>> loadCustomCups() async => 
    _customCupsLocalDataSourceImpl.getAllCustomCups();

  Future<void> deleteCustomCup(int id) async => 
    _customCupsLocalDataSourceImpl.deleteCustomCup(id);
}