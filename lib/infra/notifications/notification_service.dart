import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {    
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

  Future<void> showNotification() async {
    final androidNotificationDetails =
      AndroidNotificationDetails(
        'h_reminder', 
        'Reminders',
        channelDescription: 'Receive reminders to drink water',
        importance: .high,
        priority: .high,
      );
    
    final notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
    
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: 'Drink water',
      body: 'It is time to drink water',
      notificationDetails: notificationDetails,
    );
  }

  @pragma('vm:entry-point')
  static notificationActionTapResponse(NotificationResponse notificationResponse) {
    // TODO: Handle actions
  }
}