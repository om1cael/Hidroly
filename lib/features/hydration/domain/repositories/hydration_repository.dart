abstract class HydrationRepository {
  Future<int> addWater(int dayId, int amount);
  Future<void> removeWater(int dayId, int historyItemId, int amount);
  Future<void> updateHistoryItem(
    int dayId,
    int historyItemId,
    int amountMl,
    DateTime createdAt,
  );
}
