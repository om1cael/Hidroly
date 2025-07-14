class AppDateUtils {
  /// Takes a *local* date and returns [YYYY-MM-DD 00:00:00.000].
  static DateTime normalizedLocal(DateTime localDate) {
    return DateTime(
      localDate.year,
      localDate.month,
      localDate.day,
    );
  }
}