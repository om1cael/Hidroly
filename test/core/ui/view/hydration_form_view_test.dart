import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/core/ui/view/hydration_form_view.dart';
import 'package:hidroly/features/setup/ui/view/widgets/number_input_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late TextEditingController ageTextController;
  late TextEditingController weightTextController;
  late GlobalKey<FormState> formKey;

  setUp(() {
    ageTextController = TextEditingController();
    weightTextController = TextEditingController();
    formKey = GlobalKey<FormState>();
  });

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    
    await EasyLocalization.ensureInitialized();
  });

  group('Hydration Form View Test', () {
    Future<void> loadScreen(WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0;
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: [Locale('en', 'US')],
          path: 'assets/translations',
          fallbackLocale: Locale('en', 'US'),
          child: Builder(
            builder: (context) {
              return ProviderScope(
                child: MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  home: Scaffold(
                    body: HydrationFormView(
                      formKey: formKey, 
                      ageTextController: ageTextController, 
                      weightTextController: weightTextController
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      );

      await tester.pump();
    }

    testWidgets('Changes unit system', (WidgetTester tester) async {
      await loadScreen(tester);
      await tester.tap(find.text('lb, oz'));
      await tester.pump();
      
      final weightInput = find.widgetWithText(NumberInputFormField, 'Weight');
      await tester.tap(weightInput);

      expect(tester.widget<NumberInputFormField>(weightInput).suffix, 'lb');
    });

    testWidgets('Shows invalid input message', (WidgetTester tester) async {
      await loadScreen(tester);

      ageTextController.text = "2";
      weightTextController.text = "2";

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('weightInputRequirement'.tr(namedArgs: {'minWeight': Weight.minWeight.toString(), 'maxWeight': Weight.maxWeight.toString()})), findsOne);
      expect(find.text('ageInputRequirement'.tr(namedArgs: {'minAge': Age.minAge.toString(), 'maxAge': Age.maxAge.toString()})), findsOne);
    });
  });
}