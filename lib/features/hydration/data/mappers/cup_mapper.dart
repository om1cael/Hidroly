import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';

extension CupsTableDataX on CupsTableData {
  Cup toEntity() {
    return Cup(
      dayId: day, 
      amount: Water(amount), 
      createdAt: createdAt
    );
  }
}