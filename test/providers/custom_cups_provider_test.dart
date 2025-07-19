import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/data/datasource/custom_cups_local_datasource_impl.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomCupsLocalDataSourceImpl extends Mock implements CustomCupsLocalDataSourceImpl {}

void main() {
  late CustomCupsProvider provider;
  late CustomCupsRepository repository;
  late MockCustomCupsLocalDataSourceImpl mockDataSource;

  setUpAll(() {
    registerFallbackValue(WaterButton(amount: 1));
  });

  setUp(() {
    mockDataSource = MockCustomCupsLocalDataSourceImpl();
    repository = CustomCupsRepository(mockDataSource);
    provider = CustomCupsProvider();

    provider.setRepository(repository);
  });

  group("Test custom cup creation provider logic", () {
    test('Should create if amount is positive', () async {
      final cups = [WaterButton(id: 1, amount: 300)];

      when(() => mockDataSource.createCustomCup(any()))
        .thenAnswer((_) async {});

      when(() => mockDataSource.getAllCustomCups())
        .thenAnswer((_) async => cups);
      
      final result = await provider.createCustomCup(300);

      expect(result, true);
      expect(provider.customCups, cups);
      verify(() => mockDataSource.createCustomCup(any())).called(1);
      verify(() => mockDataSource.getAllCustomCups()).called(1);
    });

    test('Should not create if amount is zero', () async {
      expect(await provider.createCustomCup(0), false);
      verifyNever(() => mockDataSource.createCustomCup(any()));
      verifyNever(() => mockDataSource.getAllCustomCups());
    });

    test('Should not create if amount is negative', () async {
      expect(await provider.createCustomCup(-1), false);
      verifyNever(() => mockDataSource.createCustomCup(any()));
      verifyNever(() => mockDataSource.getAllCustomCups());
    });
  });
}