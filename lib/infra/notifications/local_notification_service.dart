import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hidroly/core/domain/interfaces/notification_service.dart';

@pragma('vm:entry-point')
void notificationActionTapResponse(NotificationResponse notificationResponse) {
  print(notificationResponse.actionId);
  // TODO: Handle actions
}

class LocalNotificationService implements NotificationService {
  final flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  @override
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

  @override
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

  @override
  void askForPermission() {
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
  }
}