abstract final class HydrationConstraints {
  static const int minAllowedWaterMl = 500;
  static int get minAllowedWaterOz => (minAllowedWaterMl / 29.574).round();

  static const int maxAllowedWaterMl = 6_000;
  static int get maxAllowedWaterOz => (maxAllowedWaterMl / 29.574).round();

  static const int minWaterSuggestionMl = 1200;

  static const int maxWaterSuggestionMl = 4000;
  static int get maxWaterSuggestionOz => (maxWaterSuggestionMl / 29.574).round();
}