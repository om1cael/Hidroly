import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/data/repositories/cup_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:hidroly/features/hydration/ui/view/components/cup_creation_form.dart';
import 'package:hidroly/features/hydration/ui/view/hydration_view.dart';
import 'package:hidroly/features/hydration/ui/view/components/cup_button.dart';
import 'package:hidroly/features/hydration/ui/view/components/hydration_progress_indicator.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  late ProviderContainer container;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.withData({
      'unitSystem': 0 
    });

    final appDatabase = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(overrides: [
      appDatabaseProvider.overrideWith((ref) {
        ref.onDispose(appDatabase.close);
        return appDatabase;
      }),
    ]);

    await container
      .read(dayRepositoryProvider)
      .save(Day(dailyGoal: Water.ml(2000), createdAt: DateTime.now()));
  });

  tearDown(() => container.dispose());

  Widget createTestWidget() {
    return UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: HydrationView()),
    );
  }

  group('Hydration View Tests', () {
    
    testWidgets('Should display zero progress and empty history', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(HydrationProgressIndicator), findsOneWidget);
      expect(find.textContaining('0'), findsWidgets);

      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.air), findsOneWidget);
    });

    testWidgets('Should update UI through CupButton', (tester) async {
      await container.read(cupRepositoryProvider).save(500);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(CupButton, '500 ml'));
      await tester.pumpAndSettle();

      expect(find.textContaining('500'), findsWidgets);
    });

    testWidgets('Should trigger error messages on invalid input', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text('create'));
      await tester.pumpAndSettle();
      expect(find.textContaining('inputRequired'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '99999');
      await tester.tap(find.text('create'));
      await tester.pumpAndSettle();
      expect(find.textContaining('inputRequirement'), findsOneWidget);
    });

    testWidgets('Should use presets and close modal on success', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ActionChip).first);
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text.isNotEmpty, true);

      await tester.tap(find.text('create'));
      await tester.pumpAndSettle();

      expect(find.byType(CupCreationForm), findsNothing);
    });
  });
}