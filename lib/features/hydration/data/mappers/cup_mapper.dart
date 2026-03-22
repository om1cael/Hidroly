import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';

extension CupsTableDataX on CupsTableData {
  Cup toEntity() {
    return Cup(
      dayId: day, 
      amount: amount, 
      createdAt: createdAt
    );
  }
}