import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/domain/entities/history_item.dart';

extension HistoryITemTableDataX on HistoryItemsTableData {
  HistoryItem toEntity() {
    return HistoryItem(
      dayId: day, 
      amount: amount, 
      createdAt: createdAt
    );
  }
}