import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/features/hydration/state/hydration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydration_view_model.g.dart';

@riverpod
class HydrationViewModel extends _$HydrationViewModel {
  @override
  Future<HydrationState> build() async {
    final repository = ref.watch(dayRepositoryProvider);
    final day = await repository.read(1);

    return HydrationState(day: day!);
  }
}