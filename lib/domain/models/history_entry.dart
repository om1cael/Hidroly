class HistoryEntry {
  final int? id;
  final int dayId;
  final int amount;
  final DateTime dateTime;

  const HistoryEntry(
    {
      this.id,
      required this.dayId,
      required this.amount,
      required this.dateTime,
    }
  );
  
  Map<String, Object> toMap() {
    final map = { 'dayId': dayId,'amount': amount,'dateTime': dateTime.toString() };
    if(id != null) {
      map['id'] = id as int;
    }

    return map;
  }

  @override
  String toString() {
    return (
      'HistoryEntry(id: $id, dayId: $dayId, amount: $amount, dateTime: $dateTime)'
    );
  }
}