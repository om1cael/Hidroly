import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/ui/setup/view_models/setup_view_model.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_tools.dart';
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
      final age = 'a';
      final weight = 'b';

      int? value = viewModel.getDailyGoal(age, weight);
      expect(value, null);
    });

    test('Returns null if one of the values are not valid', () {
      final age = '24';
      final weight = 'b';

      int? value = viewModel.getDailyGoal(age, weight);
      expect(value, null);
    });

    test('Returns a valid daily goal if values are valid', () {
      final age = '24';
      final weight = '65';

      int expectedDailyGoal = CalculateDailyGoal().calculate(
        int.parse(age), 
        int.parse(weight)
      );

      int? value = viewModel.getDailyGoal(age, weight);
      expect(value, expectedDailyGoal);
    });

    test('Converts to imperial if necessary', () {
      final age = '24';
      final weight = '145';

      final expectedWeightInKg = UnitTools.lbToKg(int.parse(weight));
      final expectedDailyGoal = CalculateDailyGoal().calculate(
        int.parse(age), 
        expectedWeightInKg
      );

      final result = viewModel.getDailyGoal(
        age, 
        weight, 
        providedMetricValue: false
      );

      expect(result, expectedDailyGoal);
    });
  });
}