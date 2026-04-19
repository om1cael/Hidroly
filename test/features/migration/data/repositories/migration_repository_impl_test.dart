import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/migration/data/repositories/migration_repository_impl.dart';
import 'package:hidroly/features/migration/domain/repositories/migration_repository.dart';

void main() {
  late MigrationRepository repository;

  setUp(() {
    final appDatabase = AppDatabase(NativeDatabase.memory());
    repository = MigrationRepositoryImpl(appDatabase);
  });

  group('Migration Repository Database File tests', () {
    test('Should return null if database is not found', () async {
      final result = await repository.getOldDatabase(path: '.');
      expect(result, isNull);
    });
  });
}