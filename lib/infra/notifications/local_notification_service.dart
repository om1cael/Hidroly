import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/interfaces/notification_service.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';

@pragma('vm:entry-point')
void notificationActionTapResponse(NotificationResponse notificationResponse) async {
  final providerContainer = ProviderContainer();

  final cupMap = {
    'water_standard': 200,
    'water_medium': 300,
    'water_bottle': 500,
  };

  final cup = cupMap[notificationResponse.actionId];

  if(cup != null) {
    await providerContainer.read(hydrationRepositoryProvider)
      .addWater(1, cup);
  }
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
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction('water_standard', '200 ml'),
          AndroidNotificationAction('water_medium', '300 ml'),
          AndroidNotificationAction('water_bottle', '500 ml'),
        ],
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