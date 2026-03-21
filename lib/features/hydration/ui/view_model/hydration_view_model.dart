import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/features/hydration/ui/state/hydration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydration_view_model.g.dart';

@riverpod
class HydrationViewModel extends _$HydrationViewModel {
  @override
  Future<HydrationState> build() async {
    final dayRepository = ref.watch(dayRepositoryProvider);
    final settingsRepository = ref.watch(settingsRepositoryProvider);

    final day = await dayRepository.read(1);
    final unitSystem = await settingsRepository.readUnitSystem();

    return HydrationState(day: day!, unitSystem: unitSystem);
  }
}