import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/ui/setup/view_models/setup_view_model.dart';
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
}