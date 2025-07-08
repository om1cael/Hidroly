import 'package:flutter/material.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:hidroly/data/repository/daily_history_repository.dart';

class DailyHistoryProvider extends ChangeNotifier {
  DailyHistoryRepository? _repository;

  List<HistoryEntry> _history = [];
  List<HistoryEntry> get history => _history;

  void setRepository(DailyHistoryRepository repository) {
    _repository = repository;
  }

  Future<void> create(HistoryEntry historyEntry) async {
    await _repository!.create(historyEntry);
    await getAll(historyEntry.dayId);
  }

  Future<void> getAll(int day) async {
    _history = await _repository!.getAll(day);
    notifyListeners();
  }

  Future<void> delete(int id, int day) async {
    await _repository!.delete(id);
    await getAll(day);
  }
}