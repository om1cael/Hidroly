import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/domain/entities/history_item.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';

extension HistoryITemTableDataX on HistoryItemsTableData {
  HistoryItem toEntity() {
    return HistoryItem(
      id: id,
      dayId: day, 
      amount: Water.ml(amount), 
      createdAt: createdAt
    );
  }
}