import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_repository_impl.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepositoryImpl();
}

class SettingsRepositoryImpl implements SettingsRepository {
  final sharedPreferences = SharedPreferencesAsync();

  final unitSystemKey = 'unitSystem';

  @override
  Future<void> saveUnitSystem(UnitSystem unitSystem) async {
    await sharedPreferences.setInt(unitSystemKey, unitSystem.index);
  }

  @override
  Future<UnitSystem> readUnitSystem() async {
    final index = await sharedPreferences.getInt(unitSystemKey) ?? 0;
    return UnitSystem.values[index];
  }
}