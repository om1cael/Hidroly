class Day {
  final int id;
  final int dailyGoal;
  final int currentAmount;

  const Day({
    required this.id,
    required this.dailyGoal,
    required this.currentAmount,
  });

  Map<String, Object?> toMap() {
    return {'id': id, 'dailyGoal': dailyGoal, 'currentAmount': currentAmount};
  }

  @override
  String toString() {
    return 'Day{id: $id, dailyGoal: $dailyGoal, currentAmount: $currentAmount}';
  }

  Day copyWith({int? id, int? dailyGoal, int? currentAmount}) {
    return Day(
      id: id ?? this.id,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      currentAmount: currentAmount ?? this.currentAmount,
    );
  }
}