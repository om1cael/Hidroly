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

  factory GlobalStatistic.fromJson(Map<String, dynamic> json) {
    return GlobalStatistic(
      currentStreak: json['currentStreak'] as int,
      bestStreak: json['bestStreak'] as int,
      totalIntake: json['totalIntake'] as int,
      averageIntake: json['averageIntake'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentStreak': currentStreak,
      'bestStreak': bestStreak,
      'totalIntake': totalIntake,
      'averageIntake': averageIntake,
    };
  }

  GlobalStatistic copyWith({int? currentStreak, int? bestStreak, int? totalIntake, int? averageIntake}) {
    return GlobalStatistic(
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      totalIntake: totalIntake ?? this.totalIntake,
      averageIntake: averageIntake ?? this.averageIntake,
    );
  }
}