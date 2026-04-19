import 'dart:io';

abstract class MigrationRepository {
  Future<void> migrate();
  Future<void> markDatabaseAsBackup();
  Future<File?> getOldDatabase({ String? path });
}