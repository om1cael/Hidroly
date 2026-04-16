import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  late ProviderContainer container;

  setUp(() async {
    final appDatabase = AppDatabase(NativeDatabase.memory());
    
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.withData({
      'unitSystem': 0
    });

    container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWith((ref) {
          ref.onDispose(appDatabase.close);
          return appDatabase;
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

      test('validateCupValue returns outOfBoundaries for negative or crazy values', () async {
        await container.read(hydrationViewModelProvider.future);
        final viewModel = container.read(hydrationViewModelProvider.notifier);

        expect(viewModel.validateCupValue('-50'), InputStatus.outOfBoundaries);
      });
    });
  });
}