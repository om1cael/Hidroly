import 'package:hidroly/core/domain/interfaces/aggregate_health_service.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/repositories/hydration_repository.dart';
import 'package:hidroly/infra/health_connect/health_connect_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_water_usecase.g.dart';

@riverpod
RemoveWaterUsecase removeWaterUsecase(Ref ref) {
  return RemoveWaterUsecase(
    ref.read(hydrationRepositoryProvider), 
    ref.read(healthConnectServiceProvider),
  );
}

class RemoveWaterUsecase {
  final HydrationRepository _hydrationRepository;
  final AggregateHealthService _aggregateHealthService;

  RemoveWaterUsecase(
    this._hydrationRepository,
    this._aggregateHealthService,
  );

  Future<void> execute(int dayId, int historyItemId, int amount) async {
    await _hydrationRepository.removeWater(dayId, historyItemId, amount);
    
    await _aggregateHealthService.deleteHydrationData(
      historyItemId.toString()
    );
  }
}