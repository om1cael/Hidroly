import 'package:drift/native.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/data/repositories/cup_repository_impl.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    final appDatabase = AppDatabase(NativeDatabase.memory());

    container = ProviderContainer.test(
      overrides: [
        appDatabaseProvider.overrideWith((ref) {
          ref.onDispose(appDatabase.close);
          return appDatabase;
        }),
      ]
    );
  });

  tearDown(() => container.dispose());

  group('Cup Repository Tests', () {
    test('Should delete if id is valid', () async {
      final id = await container
        .read(cupRepositoryProvider)
        .save(300);
      
      List<Cup> cupList = await container
        .read(cupRepositoryProvider)
        .readAll();
      
      expect(cupList, hasLength(1));
      
      await container
        .read(cupRepositoryProvider)
        .delete(id);
      
      cupList = await container
        .read(cupRepositoryProvider)
        .readAll();
      
      expect(cupList, hasLength(0));
    });
  });
}