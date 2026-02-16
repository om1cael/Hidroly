abstract final class SetupConstraints {
  static const int minAge = 13;
  static const int maxAge = 100;

  static const int minWeightKg = 35;
  static const int maxWeightKg = 350;

  static int get minWeightLb => (minWeightKg * 2.205).round();
  static int get maxWeightLb => (maxWeightKg * 2.205).round();
}