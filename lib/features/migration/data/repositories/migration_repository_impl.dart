import 'dart:io';

import 'package:hidroly/features/migration/domain/repositories/migration_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_repository_impl.g.dart';

@riverpod
MigrationRepository migrationRepository(Ref ref) => MigrationRepositoryImpl();

class MigrationRepositoryImpl implements MigrationRepository {
  @override
  Future<File?> getOldDatabase() async {
    try {
      final dbPath = await getApplicationDocumentsDirectory();
      File oldDbFile = File.fromUri(Uri.parse(join(dbPath.path, 'hidroly.db')));

      return oldDbFile;
    } on UnsupportedError catch (_) {
      return null;
    }
  }
}