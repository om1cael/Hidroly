class GlobalStatistic {
  final int currentStreak;
  final int bestStreak;
  final int totalIntake;
  final int averageIntake;

  const GlobalStatistic({
    required this.currentStreak,
    required this.bestStreak,
    required this.totalIntake,
    required this.averageIntake,
  });

  factory GlobalStatistic.fromJson(Map<String, Object> json) {
    return GlobalStatistic(
      currentStreak: json['currentStreak'] as int,
      bestStreak: json['bestStreak'] as int,
      totalIntake: json['totalIntake'] as int,
      averageIntake: json['averageIntake'] as int,
    );
  }
}