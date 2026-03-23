import 'package:hidroly/features/hydration/domain/entities/history_item.dart';

abstract class HistoryItemRepository {
  Future<List<HistoryItem>> readAll(int dayId);
}