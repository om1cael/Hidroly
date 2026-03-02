abstract final class HydrationConstraints {
  static const int minWaterSuggestionMl = 1200;

  static const int maxWaterSuggestionMl = 4000;
  static int get maxWaterSuggestionOz => (maxWaterSuggestionMl / 29.574).round();
}