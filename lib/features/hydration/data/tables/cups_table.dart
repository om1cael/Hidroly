import 'package:drift/drift.dart';

class CupsTable extends Table {
  IntColumn get id => integer().autoIncrement()();  
  IntColumn get amount => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
}