import 'package:drift/native.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/features/hydration/data/repositories/cup_repository_impl.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:hidroly/core/domain/value_objects/water.dart';
import 'package:hidroly/features/hydration/ui/view/components/cup_creation_form.dart';
import 'package:hidroly/features/hydration/ui/view/hydration_view.dart';
import 'package:hidroly/features/hydration/ui/view/components/cup_button.dart';
import 'package:hidroly/features/hydration/ui/view/components/hydration_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  late ProviderContainer container;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  setUp(() async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.withData({'unitSystem': 0});

    final appDatabase = AppDatabase(NativeDatabase.memory());
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
        .save(Day(dailyGoal: Water.ml(2000), createdAt: DateTime.now()));
  });

  tearDown(() => container.dispose());

  Widget createTestWidget() {
    return UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: HydrationView()),
    );
  }

  Widget createLocalizedTestWidget() {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de'),
        Locale('ru', 'RU'),
        Locale('uk', 'UA'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: UncontrolledProviderScope(
        container: container,
        child: Builder(
          builder: (context) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const HydrationView(),
          ),
        ),
      ),
    );
  }

  group('Hydration View Tests', () {
    testWidgets('Should display zero progress and empty history', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(HydrationProgressIndicator), findsOneWidget);
      expect(find.textContaining('0'), findsWidgets);

      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.air), findsOneWidget);
    });

    testWidgets('Should edit a history item amount', (tester) async {
      await container.read(hydrationRepositoryProvider).addWater(1, 300);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '450');
      await tester.tap(find.text('save'));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final day = await container.read(dayRepositoryProvider).read(1);
      expect(day.currentAmount.ml, 450);
    });

    testWidgets('Should dismiss history item editor by tapping outside', (
      tester,
    ) async {
      await container.read(hydrationRepositoryProvider).addWater(1, 300);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(TextFormField), findsNothing);
      final day = await container.read(dayRepositoryProvider).read(1);
      expect(day.currentAmount.ml, 300);
    });

    testWidgets('Should update UI through CupButton', (tester) async {
      await container.read(cupRepositoryProvider).save(500);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(CupButton, '500 ml'));
      await tester.pumpAndSettle();

      expect(find.textContaining('500'), findsWidgets);
    });

    testWidgets('Should trigger error messages on invalid input', (
      tester,
    ) async {
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

    testWidgets('Should use presets and close modal on success', (
      tester,
    ) async {
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

    testWidgets('Should delete cup', (tester) async {
      await container.read(cupRepositoryProvider).save(500);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.longPress(find.byType(CupButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete).last);

      await tester.runAsync(() => Future.delayed(Duration.zero));
      await tester.runAsync(() => Future.delayed(Duration.zero));

      await tester.pumpAndSettle();

      expect(find.byType(CupButton), findsNothing);
    });

    testWidgets('Should translate the editor subtitle', (tester) async {
      await container.read(hydrationRepositoryProvider).addWater(1, 300);

      await tester.pumpWidget(createLocalizedTestWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      expect(
        find.text('Update the amount and time for this entry.'),
        findsOneWidget,
      );
    });
  });
}
