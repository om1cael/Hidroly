import 'dart:io';

abstract class MigrationRepository {
  Future<void> migrate();
  Future<void> migrateNotificationSetup();
  Future<void> markDatabaseAsBackup();
  Future<File?> getOldDatabase();
}