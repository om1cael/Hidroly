import 'package:hidroly/data/model/history_entry.dart';

abstract class DailyHistoryLocalDataSource {
  Future<void> create(HistoryEntry historyEntry);
  Future<List<HistoryEntry>> getAll();
  Future<void> delete(int id);
}