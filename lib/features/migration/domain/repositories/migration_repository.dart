import 'dart:io';

abstract class MigrationRepository {
  Future<File?> getOldDatabase();
}