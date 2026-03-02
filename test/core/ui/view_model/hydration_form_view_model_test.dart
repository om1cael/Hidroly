import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/core/ui/view_model/hydration_form_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

void main() {
  late ProviderContainer container;
  late HydrationFormViewModel viewModel;

  setUp(() {
    container = ProviderContainer.test();
    viewModel = container.read(hydrationFormViewModelProvider.notifier);
  });

  tearDown(() => container.dispose());

  group('Test Hydration Form View Model', () {
    test('Returns noInput if input is null or empty', () {
      expect(viewModel.validateAge(null), equals(InputStatus.noInput));
      expect(viewModel.validateAge(""), equals(InputStatus.noInput));

      expect(viewModel.validateWeight(null), equals(InputStatus.noInput));
      expect(viewModel.validateWeight(""), equals(InputStatus.noInput));
    });

    test("Returns out of boundaries if input is out of range", () {
      expect(viewModel.validateAge((Age.minAge - 1).toString()), equals(InputStatus.outOfBoundaries));
      expect(viewModel.validateWeight((Weight.minWeight - 1).toString()), equals(InputStatus.outOfBoundaries));
    });

    test("Returns out of boundaries if input is not a number", () {
      expect(viewModel.validateAge("abc"), equals(InputStatus.outOfBoundaries));
      expect(viewModel.validateWeight("abc"), equals(InputStatus.outOfBoundaries));
    });

    test("Returns success if input is valid", () {
      expect(viewModel.validateAge((Age.minAge).toString()), equals(InputStatus.success));
      expect(viewModel.validateWeight((Weight.minWeight).toString()), equals(InputStatus.success));
    });

    test("Maps correctly to person on metric", () {
      final person = viewModel.mapToPerson("18", "65");
      expect(person, isNotNull);
      expect(person.age.value, equals(18));
      expect(person.weight.kg, equals(65));
    });

    test("Maps correctly to person on imperial", () {
      final expectedWeightKg = 66;
      final weightLb = 145;

      viewModel.setUnitSystem(UnitSystem.imperial);

      final person = viewModel.mapToPerson("18", weightLb.toString());

      expect(person, isNotNull);
      expect(person.age.value, equals(18));
      expect(person.weight.kg, equals(expectedWeightKg));
    });
  });
}