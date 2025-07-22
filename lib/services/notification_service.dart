import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final flutterLocalNotificationsPlugin 
    = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings(
      "@mipmap/ic_launcher"
    );

    final InitializationSettings initializationSettings = 
      InitializationSettings(
        android: androidSettings,
      );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }
  
  Future<void> showNotification() async {
    final androidNotificationDetails = AndroidNotificationDetails(
      'water-reminder', 
      'Remind me to drink water',
      channelDescription: 'Get reminders to drink water throughout the day',
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, 
      'Hey, let\'s drink some water!', 
      'It\'s been at least 2 hours since you last drank water.', 
      notificationDetails
    );
  }
}