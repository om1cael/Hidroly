import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/domain/models/water_button.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomCupsRepository extends Mock implements CustomCupsRepository {}

void main() {
  late CustomCupsProvider provider;
  late CustomCupsRepository repository;

  setUpAll(() {
    registerFallbackValue(WaterButton(amount: 1));
  });

  setUp(() {
    repository = MockCustomCupsRepository();
    provider = CustomCupsProvider();

    provider.setRepository(repository);
  });

  group("Test custom cup creation provider logic", () {
    test('Should create if amount is positive', () async {
      final cups = [WaterButton(id: 1, amount: 300)];

      when(() => repository.createCustomCup(any()))
        .thenAnswer((_) async {});

      when(() => repository.getAllCustomCups())
        .thenAnswer((_) async => cups);
      
      final result = await provider.createCustomCup(300);

      expect(result, true);
      expect(provider.customCups, cups);
      verify(() => repository.createCustomCup(any())).called(1);
      verify(() => repository.getAllCustomCups()).called(1);
    });

    test('Should not create if amount is zero', () async {
      expect(await provider.createCustomCup(0), false);
      verifyNever(() => repository.createCustomCup(any()));
      verifyNever(() => repository.getAllCustomCups());
    });

    test('Should not create if amount is negative', () async {
      expect(await provider.createCustomCup(-1), false);
      verifyNever(() => repository.createCustomCup(any()));
      verifyNever(() => repository.getAllCustomCups());
    });
  });
}