import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/ui/setup/view_models/setup_view_model.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:mocktail/mocktail.dart';

class MockDayProvider extends Mock implements DayProvider {}
class MockCustomCupsProvider extends Mock implements CustomCupsProvider {}
class MockSettingsProvider extends Mock implements SettingsProvider {}

void main() {
  late SetupViewModel viewModel;
  late MockDayProvider dayProvider;
  late MockCustomCupsProvider customCupsProvider;
  late MockSettingsProvider settingsProvider;

  setUp(() {
    dayProvider = MockDayProvider();
    customCupsProvider = MockCustomCupsProvider();
    settingsProvider = MockSettingsProvider();

    viewModel = SetupViewModel(
      dayProvider: dayProvider, 
      customCupsProvider: customCupsProvider, 
      settingsProvider: settingsProvider
    );
  });

  group('Daily Goal Validation:', () {
    test('Returns null if values are not valid', () {
      final ageController = TextEditingController(text: null);
      final weightController = TextEditingController(text: null);

      int? value = viewModel.getDailyGoal(ageController, weightController);
      expect(value, null);
    });

    test('Returns null if one of the values are not valid', () {
      final ageController = TextEditingController(text: '24');
      final weightController = TextEditingController(text: null);

      int? value = viewModel.getDailyGoal(ageController, weightController);
      expect(value, null);
    });

    test('Returns a valid daily goal if values are valid', () {
      final ageController = TextEditingController(text: '24');
      final weightController = TextEditingController(text: '65');

      final age = int.parse(ageController.text);
      final weight = int.parse(weightController.text);

      int dailyGoal = CalculateDailyGoal().calculate(age, weight);

      int? value = viewModel.getDailyGoal(ageController, weightController);
      expect(value, dailyGoal);
    });
  });
}