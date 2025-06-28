class User {
  final int id;
  final int dailyGoal;
  final int currentAmount;

  const User({
    required this.id,
    required this.dailyGoal,
    required this.currentAmount,
  });

  Map<String, Object?> toMap() {
    return {'id': id, 'dailyGoal': dailyGoal, 'currentAmount': currentAmount};
  }

  @override
  String toString() {
    return 'User{id: $id, dailyGoal: $dailyGoal, currentAmount: $currentAmount}';
  }
}