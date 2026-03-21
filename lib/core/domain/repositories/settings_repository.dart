import 'package:hidroly/core/domain/enums/unit_systems.dart';

abstract class SettingsRepository {
  void saveUnitSystem(UnitSystem unitSystem);
  Future<UnitSystem> readUnitSystem();
}