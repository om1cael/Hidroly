import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';

extension CupsTableDataX on CupsTableData {
  Cup toEntity() {
    return Cup(
      id: id,
      amount: CupValue.ml(amount), 
      createdAt: createdAt
    );
  }
}