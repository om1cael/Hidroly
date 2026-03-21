import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/entities/person.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/features/setup/domain/usecases/complete_setup_use_case.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:hidroly/features/setup/ui/view/setup_view.dart';
import 'package:hidroly/features/setup/ui/view/widgets/number_input_form_field.dart';
import 'package:hidroly/features/setup/ui/view_model/setup_view_model.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../testing/usecases/mock_complete_setup_use_case.dart';

class FakeSetupViewModel extends SetupViewModel {
  @override SetupState build() => SetupState(stage: .idle);
}

class FakeProcessingSetupViewModel extends FakeSetupViewModel {
  @override SetupState build() => SetupState(stage: .processing);
}

void main() {
  setUpAll(() {
    registerFallbackValue(Person(age: Age(25), weight: Weight.kg(75)));
    registerFallbackValue(UnitSystem.metric);
  });

  group('Setup View Test', () {
    Future<void> loadScreen(WidgetTester tester, ProviderContainer container) async {
      tester.view.devicePixelRatio = 1.0;
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: SetupView(),
          ),
        ),
      );
      await tester.pump();
    }

    testWidgets('Does not proceed if form is not valid', (tester) async {
      await loadScreen(tester, ProviderContainer());
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SetupView), findsOne);
    });

    testWidgets('Shows loading indicator when processing', (tester) async {
      await loadScreen(tester, ProviderContainer(
        overrides: [setupViewModelProvider.overrideWith(() => FakeProcessingSetupViewModel())],
      ));
      expect(find.byType(CircularProgressIndicator), findsOne);
      expect(find.byType(FloatingActionButton), findsNothing);
    });

    testWidgets('Shows error dialog', (tester) async {
      final mockUseCase = MockCompleteSetupUseCase();
      when(() => mockUseCase.execute(any(), any()))
          .thenAnswer((_) async => throw Exception());

      await loadScreen(tester, ProviderContainer(
        overrides: [completeSetupUseCaseProvider.overrideWithValue(mockUseCase)],
      ));

      await tester.enterText(find.widgetWithText(NumberInputFormField, 'age'), '18');
      await tester.enterText(find.widgetWithText(NumberInputFormField, 'weight'), '65');
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOne);
      expect(find.text('errorOccurred'), findsOne);
    });

    testWidgets('Shows dialog if clamped', (tester) async {
      final mockUseCase = MockCompleteSetupUseCase();
      when(() => mockUseCase.execute(any(), any()))
          .thenAnswer((_) async => Person(age: Age(18), weight: Weight.kg(150)).calculateHydrationGoalMl());
      
      await loadScreen(tester, ProviderContainer(
        overrides: [
          completeSetupUseCaseProvider.overrideWithValue(mockUseCase),
        ],
      ));

      await tester.enterText(find.widgetWithText(NumberInputFormField, 'age'), '18');
      await tester.enterText(find.widgetWithText(NumberInputFormField, 'weight'), '150');
      await tester.tap(find.byType(FloatingActionButton));

      await tester.pump();

      expect(find.byType(AlertDialog), findsOne);
      expect(find.text('dailyGoalDisclaimerTitle'), findsOne);
    });
  });
}