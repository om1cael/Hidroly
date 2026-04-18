import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unit_system_provider.g.dart';

@riverpod
class UnitSystemProvider extends _$UnitSystemProvider {
  @override
  Future<UnitSystem> build() {
    return ref.watch(settingsRepositoryProvider).readUnitSystem();
  }

  void setUnitSystem(UnitSystem unitSystem) {
    ref.read(settingsRepositoryProvider).saveUnitSystem(unitSystem);
    state = AsyncValue.data(unitSystem);
  }
}