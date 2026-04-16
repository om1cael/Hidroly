import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/ui/view/hydration_form_view.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';

void main() {
  late TextEditingController ageTextController;
  late TextEditingController weightTextController;
  late GlobalKey<FormState> formKey;

  setUp(() {
    ageTextController = TextEditingController();
    weightTextController = TextEditingController();
    formKey = GlobalKey<FormState>();
  });

  group('Hydration Form View Test', () {
    Future<void> loadScreen(WidgetTester tester) async {
      tester.view.devicePixelRatio = 1.0;
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: HydrationFormView(
                formKey: formKey, 
                ageTextController: ageTextController, 
                weightTextController: weightTextController
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('Changes unit system', (WidgetTester tester) async {
      await loadScreen(tester);
      await tester.pump();

      await tester.tap(find.text('lb, oz'));
      final weightInput = find.widgetWithText(NumberInputFormField, 'weight');

      await tester.pump();
      expect(tester.widget<NumberInputFormField>(weightInput).suffix, 'lb');
    });

    testWidgets('Shows invalid input message', (WidgetTester tester) async {
      await loadScreen(tester);
      await tester.pump();

      ageTextController.text = "2";
      weightTextController.text = "2";

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('weightInputRequirement'), findsOne);
      expect(find.text('ageInputRequirement'), findsOne);
    });
  });
}