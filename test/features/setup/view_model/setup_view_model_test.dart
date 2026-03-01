import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/entities/hydration_goal.dart';
import 'package:hidroly/core/domain/entities/person.dart';
import 'package:hidroly/core/domain/enums/process_stage.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/features/setup/domain/usecases/complete_setup_use_case.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:hidroly/features/setup/ui/view_model/setup_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/usecases/mock_complete_setup_use_case.dart';

class FakeSetupViewModel extends SetupViewModel {
  @override
  SetupState build() => SetupState(stage: .error);
}

void main() {
  setUpAll(() {
    registerFallbackValue(Person(age: Age(25), weight: Weight.kg(75)));
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
      
      when(() => mockUseCase.execute(any()))
        .thenAnswer((_) async => hydrationGoal);
      
      await container.read(setupViewModelProvider.notifier).completeSetup("25", "150");

      expect(container.read(setupViewModelProvider).stage, equals(ProcessStage.success));
      expect(container.read(setupViewModelProvider).dailyGoalClamped, equals(true));
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
      
      when(() => mockUseCase.execute(any()))
        .thenAnswer((_) async => hydrationGoal);
      
      await container.read(setupViewModelProvider.notifier).completeSetup("25", "65");

      expect(container.read(setupViewModelProvider).stage, equals(ProcessStage.success));
      expect(container.read(setupViewModelProvider).dailyGoalClamped, equals(false));
    });

    test('Goes to an error state if necessary', () async {
      final container = ProviderContainer.test(
        overrides: [
          completeSetupUseCaseProvider.overrideWithValue(MockCompleteSetupUseCase()),
        ]
      );

      final mockUseCase = container.read(completeSetupUseCaseProvider);
      
      when(() => mockUseCase.execute(any()))
        .thenThrow(Exception());
      
      await container.read(setupViewModelProvider.notifier).completeSetup("25", "65");

      expect(container.read(setupViewModelProvider).stage, equals(ProcessStage.error));
    });

    test('Does not complete setup if stage is not idle', () async {
      final container = ProviderContainer.test(
        overrides: [
          setupViewModelProvider.overrideWith(() => FakeSetupViewModel()),
          completeSetupUseCaseProvider.overrideWithValue(MockCompleteSetupUseCase()),
        ]
      );

      final mockUseCase = container.read(completeSetupUseCaseProvider);
      final viewModel = container.read(setupViewModelProvider.notifier);

      when(() => mockUseCase.execute(any()))
        .thenAnswer((_) => Completer<HydrationGoal>().future);

      viewModel.completeSetup("18", "65");
      expect(container.read(setupViewModelProvider).stage, equals(ProcessStage.error));
    });
  });
}