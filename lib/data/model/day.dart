class Day {
  final int? id;
  final int dailyGoal;
  final int currentAmount;
  final DateTime date;

  const Day({
    this.id,
    required this.dailyGoal,
    this.currentAmount = 0,
    required this.date,
  });

  Map<String, Object?> toMap() {
    final map = {'dailyGoal': dailyGoal, 'currentAmount': currentAmount, 'date': date.toIso8601String()};

    if(id != null) {
      map['id'] = id as int;
    }

    return map;
  }

  @override
  String toString() {
    return 'Day{id: $id, dailyGoal: $dailyGoal, currentAmount: $currentAmount, date: $date}';
  }

  Day copyWith({int? id, int? dailyGoal, int? currentAmount, DateTime? date}) {
    return Day(
      id: id ?? this.id,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      currentAmount: currentAmount ?? this.currentAmount,
      date: date ?? this.date,
    );
  }
}