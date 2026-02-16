abstract final class SetupConstraints {
  static const int minAge = 13;
  static const int maxAge = 100;

  static const int minWeightKg = 35;
  static const int maxWeightKg = 150;

  static int get minWeightLb => (minWeightKg * 2.205).round();
  static int get maxWeightLb => (maxWeightKg * 2.205).round();

  static const int maxWaterSuggestionMl = 4000;
  static int get maxWaterSuggestionOz => (maxWaterSuggestionMl / 29.574).round();
}