import 'package:hidroly/data/datasource/daily_history_local_datasource_impl.dart';
import 'package:hidroly/data/model/history_entry.dart';

class DailyHistoryRepository {
  final DailyHistoryLocalDataSourceImpl _dataSource;

  const DailyHistoryRepository(this._dataSource);

  Future<void> create(HistoryEntry historyEntry) async => 
    _dataSource.create(historyEntry);
  
  Future<List<HistoryEntry>> getAll(int day) async =>
    _dataSource.getAll(day);

  Future<void> delete(int id) async =>
    _dataSource.delete(id);
}