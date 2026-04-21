import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  Future<void> initialize() async {
    final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
    
    // TODO: Change icon
    const androidInitializationSettings = 
      AndroidInitializationSettings('@mipmap/ic_launcher');

    final initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
    
    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveBackgroundNotificationResponse: notificationActionTapResponse,
    );
  }

  @pragma('vm:entry-point')
  static notificationActionTapResponse(NotificationResponse notificationResponse) {
    // TODO: Handle actions
  }
}