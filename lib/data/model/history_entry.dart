class HistoryEntry {
  final int id;
  final int dayId;
  final int amount;
  final DateTime dateTime;

  const HistoryEntry(
    {
      required this.id,
      required this.dayId,
      required this.amount,
      required this.dateTime,
    }
  );
  
  Map<String, Object> toMap() {
    return {
      'id': id,
      'dayId': dayId,
      'amount': amount,
      'dateTime': dateTime,
    };
  }

  @override
  String toString() {
    return (
      'HistoryEntry(id: $id, dayId: $dayId, amount: $amount, dateTime: $dateTime)'
    );
  }
}