import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/tables/day_table.dart';

class CupsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get day => integer().references(
    DayTable, 
    #id, 
    onUpdate: .cascade,
    onDelete: .cascade,
  )();
  
  IntColumn get amount => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
}