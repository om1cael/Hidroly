import 'dart:io';

abstract class MigrationRepository {
  Future<void> migrate();
  Future<File?> getOldDatabase();
}