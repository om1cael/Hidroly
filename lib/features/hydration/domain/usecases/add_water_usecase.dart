import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/interfaces/aggregate_health_service.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/repositories/hydration_repository.dart';
import 'package:hidroly/infra/health_connect/health_connect_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_water_usecase.g.dart';

@riverpod
AddWaterUsecase addWaterUsecase(Ref ref) {
  return AddWaterUsecase(
    ref.read(hydrationRepositoryProvider), 
    ref.read(healthConnectServiceProvider),
  );
}

class AddWaterUsecase {
  final HydrationRepository _hydrationRepository;
  final AggregateHealthService _aggregateHealthService;

  AddWaterUsecase(
    this._hydrationRepository,
    this._aggregateHealthService,
  );

  Future<void> execute(Day day, int amount) async {
    await _hydrationRepository.addWater(day.id, amount);
    
    final now = DateTime.now();
    final amountInLiters = (amount / 1000);
    
    await _aggregateHealthService.writeHydrationData(
      double.parse(amountInLiters.toString()), 
      DateTime(day.createdAt.year, day.createdAt.month, day.createdAt.day, now.hour, now.minute, now.second),
    );
  }
}