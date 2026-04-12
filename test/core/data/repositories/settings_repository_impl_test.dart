import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:test/test.dart';

void main() {
  late ProviderContainer provider;
  
  setUp(() {
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
    provider = ProviderContainer.test();
  });

  tearDown(() {
    provider.dispose();
  });

  group('Settings Repository tests', () {
    test('Returns metric if unit system was not defined', () async {
      final unitSystem =
        await provider.read(settingsRepositoryProvider).readUnitSystem();
      
      expect(unitSystem, UnitSystem.metric);
    });

    test('Returns correct unit system', () async {
      final sharedPreferences = SharedPreferencesAsync();
      await sharedPreferences.setInt('unitSystem', 0);

      final unitSystem = 
        await provider.read(settingsRepositoryProvider).readUnitSystem();

      expect(unitSystem, UnitSystem.metric);

      await sharedPreferences.setInt('unitSystem', 1);

      final newUnitSystem = 
        await provider.read(settingsRepositoryProvider).readUnitSystem();
      
      expect(newUnitSystem, UnitSystem.imperial );
    });
  });
}