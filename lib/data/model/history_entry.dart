import 'package:hidroly/data/model/day.dart';

class HistoryEntry {
  final int id;
  final Day day;
  final int amount;
  final DateTime dateTime;

  const HistoryEntry(
    {
      required this.id,
      required this.day,
      required this.amount,
      required this.dateTime,
    }
  );
  
  Map<String, Object> toMap() {
    return {
      'id': id,
      'day': day,
      'amount': amount,
      'dateTime': dateTime,
    };
  }

  @override
  String toString() {
    return (
      'HistoryEntry(id: $id, day: $day, amount: $amount, dateTime: $dateTime)'
    );
  }
}