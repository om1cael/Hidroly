import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/entities/hydration_goal.dart';
import 'package:hidroly/core/domain/entities/person.dart';
import 'package:hidroly/core/domain/enums/process_stage.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/features/setup/domain/usecases/complete_setup_use_case.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:hidroly/features/setup/ui/view_model/setup_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/usecases/mock_complete_setup_use_case.dart';

class ErrorSetupViewModel extends SetupViewModel {
  @override
  SetupState build() => SetupState.error('');
}

void main() {
  setUpAll(() {
    registerFallbackValue(Person(age: Age(25), weight: Weight.kg(75)));
    registerFallbackValue(UnitSystem.metric);
  });

  group('Setup View Model Tests', () {
    test('Returns clamp in the state if necessary', () async {
      final container = ProviderContainer.test(
        overrides: [
          completeSetupUseCaseProvider.overrideWithValue(MockCompleteSetupUseCase()),
        ]
      );

      final mockUseCase = container.read(completeSetupUseCaseProvider);
      
      final hydrationGoal = Person(age: Age(25), weight: Weight.kg(150))
        .calculateHydrationGoalMl();
      
      when(() => mockUseCase.execute(any(), any()))
        .thenAnswer((_) async => hydrationGoal);
      
      await container.read(setupViewModelProvider.notifier).completeSetup("25", "150");
      final state = container.read(setupViewModelProvider);

      expect(state, equals(SetupState.done(dailyGoalClamped: true)));
    });

    test('Does not return clamp in the state if not necessary', () async {
      final container = ProviderContainer.test(
        overrides: [
          completeSetupUseCaseProvider.overrideWithValue(MockCompleteSetupUseCase()),
        ]
      );

      final mockUseCase = container.read(completeSetupUseCaseProvider);

      final hydrationGoal = Person(age: Age(25), weight: Weight.kg(65))
        .calculateHydrationGoalMl();
      
      when(() => mockUseCase.execute(any(), any()))
        .thenAnswer((_) async => hydrationGoal);
      
      await container.read(setupViewModelProvider.notifier).completeSetup("25", "65");
      final state = container.read(setupViewModelProvider);

      expect(state, equals(SetupState.done(dailyGoalClamped: false)));
    });

    test('Goes to an error state if necessary', () async {
      final container = ProviderContainer.test(
        overrides: [
          completeSetupUseCaseProvider.overrideWithValue(MockCompleteSetupUseCase()),
        ]
      );

      final mockUseCase = container.read(completeSetupUseCaseProvider);
      
      when(() => mockUseCase.execute(any(), any()))
        .thenThrow(Exception(''));
      
      await container.read(setupViewModelProvider.notifier).completeSetup("25", "65");

      expect(container.read(setupViewModelProvider), equals(SetupState.error('Exception: ')));
    });
  });
}