import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/data/mappers/history_item_mapper.dart';
import 'package:hidroly/features/hydration/domain/entities/history_item.dart';
import 'package:hidroly/features/hydration/domain/repositories/history_item_repository.dart';

class HistoryItemRepositoryImpl implements HistoryItemRepository {
  final AppDatabase _database;

  const HistoryItemRepositoryImpl(this._database);

  @override
  Future<List<HistoryItem>> readAll(int dayId) async {
    final data = await (_database.select(_database.historyItemsTable)
      ..where((item) => item.day.equals(dayId)))
      .get();
    
    return [for(final item in data) item.toEntity()];
  }
}