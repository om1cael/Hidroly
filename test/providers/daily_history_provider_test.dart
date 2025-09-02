import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/domain/models/history_entry.dart';
import 'package:hidroly/data/repository/daily_history_repository.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockDailyHistoryRepository extends Mock implements DailyHistoryRepository {}

void main() {
  late MockDailyHistoryRepository repository;
  late DailyHistoryProvider provider;
  late List<HistoryEntry> dayHistory;

  setUp(() {
    repository = MockDailyHistoryRepository();
    provider = DailyHistoryProvider();
    provider.setRepository(repository);

    dayHistory = [
      HistoryEntry(id: 1, dayId: 1, amount: 300, dateTime: DateTime.utc(2025, 1, 1)),
      HistoryEntry(id: 2, dayId: 1, amount: 600, dateTime: DateTime.utc(2025, 1, 1)),
    ];

    when(() => repository.getAll(1))
      .thenAnswer((_) async => dayHistory);
  });

  test('History list updates after create', () async {
    final newHistoryEntry = 
      HistoryEntry(id: 3, dayId: 1, amount: 900, dateTime: DateTime.utc(2025, 1, 1));
    
    final newDayHistory = [...dayHistory, newHistoryEntry];
    
    when(() => repository.create(newHistoryEntry))
      .thenAnswer((_) async {});

    when(() => repository.getAll(1))
      .thenAnswer((_) async => newDayHistory);

    await provider.create(newHistoryEntry);
    expect(provider.history, newDayHistory);
  });

  test('History list updates after delete', () async {
    final newDayHistory = dayHistory
      .where((history) => history.id != 2)
      .toList();
    
    when(() => repository.delete(2))
      .thenAnswer((_) async {});

    when(() => repository.getAll(1))
      .thenAnswer((_) async => newDayHistory);

    await provider.delete(2, 1);
    expect(provider.history, newDayHistory);
  });

  test('History list updates after getAll', () async {
    await provider.getAll(1);
    expect(provider.history, dayHistory);
  });
}