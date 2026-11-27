import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/core/domain/value_objects/water.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';
import 'package:hidroly/infra/health_connect/health_connect_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import '../../../../../testing/fake_health_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late FakeHealthService fakeHealthService;

  setUp(() async {
    final appDatabase = AppDatabase(NativeDatabase.memory());

    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.withData({'unitSystem': 0});
    fakeHealthService = FakeHealthService();

    container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWith((ref) {
          ref.onDispose(appDatabase.close);
          return appDatabase;
        }),
        healthConnectServiceProvider.overrideWith((ref) {
          return fakeHealthService;
        }),
      ],
    );

    await container
        .read(dayRepositoryProvider)
        .save(Day(dailyGoal: Water.ml(2000), createdAt: DateTime(2026, 1, 1)));
  });

  tearDown(() => container.dispose());

  group('Hydration View Model Tests', () {
    test('Initial build loads data correctly', () async {
      final state = await container.read(hydrationViewModelProvider.future);

      expect(state.day.currentAmount.ml, 0);
      expect(state.history, isEmpty);
      expect(state.cups, isNotNull);
    });

    test('addWater invalidates state and updates amount', () async {
      await container.read(hydrationViewModelProvider.future);

      final viewModel = container.read(hydrationViewModelProvider.notifier);

      await viewModel.addWater(500);

      final newState = await container.read(hydrationViewModelProvider.future);

      expect(newState.day.currentAmount.ml, 500);
      expect(newState.history, hasLength(1));
    });

    test(
      'updateHistoryItem persists amount and time and reloads state',
      () async {
        await container.read(hydrationViewModelProvider.future);
        final viewModel = container.read(hydrationViewModelProvider.notifier);
        await viewModel.addWater(500);
        final addedState = await container.read(
          hydrationViewModelProvider.future,
        );
        final historyItem = addedState.history.single;
        final updatedAt = DateTime(2026, 1, 1, 8, 30);

        await viewModel.updateHistoryItem(historyItem.id, 750, updatedAt);

        final updatedState = await container.read(
          hydrationViewModelProvider.future,
        );
        expect(updatedState.history.single.createdAt, updatedAt);
        expect(updatedState.history.single.amount.ml, 750);
        expect(updatedState.day.currentAmount.ml, 750);
        expect(fakeHealthService.deletedHydrationRecordIds, ['1']);
        expect(fakeHealthService.writtenHydrationRecords.last, (
          amount: 750.0,
          recordTime: updatedAt,
          id: '1',
        ));
      },
    );

    test(
      'updateHistoryItem converts imperial input to ml before persisting',
      () async {
        SharedPreferencesAsyncPlatform.instance =
            InMemorySharedPreferencesAsync.withData({'unitSystem': 1});

        await container.read(hydrationViewModelProvider.future);
        final viewModel = container.read(hydrationViewModelProvider.notifier);
        await viewModel.addWater(300);
        var state = await container.read(hydrationViewModelProvider.future);
        final historyItem = state.history.single;
        final updatedAt = DateTime(2026, 1, 1, 8, 30);

        await viewModel.updateHistoryItem(historyItem.id, 10, updatedAt);
        state = await container.read(hydrationViewModelProvider.future);
        expect(state.history.single.amount.ml, 300);

        await viewModel.updateHistoryItem(historyItem.id, 16, updatedAt);
        state = await container.read(hydrationViewModelProvider.future);

        expect(state.unitSystem, UnitSystem.imperial);
        expect(state.history.single.amount.ml, 473);
        expect(state.day.currentAmount.ml, 473);
        expect(fakeHealthService.writtenHydrationRecords.last.amount, 473.0);
      },
    );

    test('loadByDate updates selectedDate and triggers rebuild', () async {
      await container.read(hydrationViewModelProvider.future);
      final viewModel = container.read(hydrationViewModelProvider.notifier);
      final newDate = DateTime(2026, 1, 2);

      await viewModel.loadByDate(newDate);

      final selectedDate = container.read(selectedDateProvider);
      expect(selectedDate, newDate);

      final state = await container.read(hydrationViewModelProvider.future);
      expect(state.day.createdAt, newDate);
    });

    group('Validation Logic', () {
      test('validateCupValue returns success for valid input', () async {
        await container.read(hydrationViewModelProvider.future);
        final viewModel = container.read(hydrationViewModelProvider.notifier);

        expect(viewModel.validateCupValue('200'), InputStatus.success);
        expect(viewModel.validateCupValue(''), InputStatus.noInput);
        expect(viewModel.validateCupValue(null), InputStatus.noInput);
      });

      test(
        'validateCupValue returns outOfBoundaries for negative or crazy values',
        () async {
          await container.read(hydrationViewModelProvider.future);
          final viewModel = container.read(hydrationViewModelProvider.notifier);

          expect(
            viewModel.validateCupValue('-50'),
            InputStatus.outOfBoundaries,
          );
        },
      );
    });
  });
}
