abstract class NotificationService {
  Future<void> initialize();
  Future<void> showNotification();
  void askForPermission();
}