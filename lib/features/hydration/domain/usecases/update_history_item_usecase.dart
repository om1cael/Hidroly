import 'package:hidroly/core/domain/interfaces/aggregate_health_service.dart';
import 'package:hidroly/features/hydration/domain/repositories/hydration_repository.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:hidroly/infra/health_connect/health_connect_service.dart';
import 'package:riverpod/riverpod.dart';

final updateHistoryItemUsecaseProvider = Provider<UpdateHistoryItemUsecase>((
  ref,
) {
  return UpdateHistoryItemUsecase(
    ref.read(hydrationRepositoryProvider),
    ref.read(healthConnectServiceProvider),
  );
});

class UpdateHistoryItemUsecase {
  final HydrationRepository _hydrationRepository;
  final AggregateHealthService _aggregateHealthService;

  UpdateHistoryItemUsecase(
    this._hydrationRepository,
    this._aggregateHealthService,
  );

  Future<void> execute(
    int dayId,
    int historyItemId,
    int amountMl,
    DateTime createdAt,
  ) async {
    await _hydrationRepository.updateHistoryItem(
      dayId,
      historyItemId,
      amountMl,
      createdAt,
    );

    final recordId = historyItemId.toString();
    await _aggregateHealthService.deleteHydrationData(recordId);
    final wasWritten = await _aggregateHealthService.writeHydrationData(
      amountMl.toDouble(),
      createdAt,
      recordId,
    );
    if (!wasWritten) {
      throw StateError('Failed to update hydration data in Health Connect');
    }
  }
}
