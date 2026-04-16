abstract class HydrationRepository {
  Future<void> addWater(int dayId, int amount);
  Future<void> removeWater(int dayId, int historyItemId, int amount);
}