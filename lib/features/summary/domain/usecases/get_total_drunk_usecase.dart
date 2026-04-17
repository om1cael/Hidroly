import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_total_drunk_usecase.g.dart';

@riverpod
GetTotalDrunkUseCase getTotalDrunkUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return GetTotalDrunkUseCase(dayRepository);
}

class GetTotalDrunkUseCase {
  final DayRepository _dayRepository;

  const GetTotalDrunkUseCase(this._dayRepository);

  Future<int> execute() async {
    final dayList = await _dayRepository.readAll();
    
    final totalDrunk = dayList.fold(
      0, (previousValue, day) => previousValue + day.currentAmount.ml);
    
    return totalDrunk;
  }
}