import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/interfaces/notification_service.dart';
import 'package:hidroly/core/providers/local_notification_service_provider.dart';
import 'package:hidroly/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if(task != 'send_notification') return Future.value(true);
    final providerContainer = ProviderContainer();

    final title = inputData!['title'];
    final body = inputData['body'];

    final dayRepository = providerContainer.read(dayRepositoryProvider);
    final notificationService = providerContainer.read(localNotificationServiceProvider);
    final settingsRepository = providerContainer.read(settingsRepositoryProvider);
    
    final now = TimeOfDay.now();
    final wakeUpTime = await settingsRepository.readWakeUpTime();
    final sleepTime = await settingsRepository.readSleepTime();
    final unitSystem = await settingsRepository.readUnitSystem();

    final latestDay = await dayRepository.readLatest();
    if(latestDay.currentAmount.ml >= latestDay.dailyGoal.ml) {
      return Future.value(true);
    }

    await notificationService.initialize();
    
    bool isNotificationAllowed = notificationService.isNotificationAllowed(
      now, 
      wakeUpTime, 
      sleepTime,
    );

    if(isNotificationAllowed) {
      notificationService.showNotification(title, body, unitSystem);
    }

    providerContainer.dispose();
    return Future.value(true);
  });
}

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
    final latestDay = await providerContainer
      .read(dayRepositoryProvider)
      .readLatest();

    await providerContainer.read(hydrationRepositoryProvider)
      .addWater(latestDay.id, cup);
  }

  providerContainer.dispose();
}

class LocalNotificationService implements NotificationService {
  final flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  @override
  Future<void> initialize() async {    
    // TODO: Change icon
    const androidInitializationSettings = 
      AndroidInitializationSettings('@drawable/ic_notification');

    final initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
    
    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveBackgroundNotificationResponse: notificationActionTapResponse,
    );
  }

  @override
  Future<void> showNotification(
    String title,
    String body,
    UnitSystem unitSystem
  ) async {
    await flutterLocalNotificationsPlugin.cancelAll();

    final androidNotificationDetails =
      AndroidNotificationDetails(
        'h_reminder', 
        'Reminders',
        channelDescription: 'Receive reminders to drink water',
        importance: .high,
        priority: .high,
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction('water_standard', unitSystem == .metric ? '200 ml' : '7 oz'),
          AndroidNotificationAction('water_medium', unitSystem == .metric ? '300 ml' : '10 oz'),
          AndroidNotificationAction('water_bottle', unitSystem == .metric ? '500 ml' : '17 oz'),
        ],
      );
    
    final notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
    
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
    );
  }
  
  @override
  void setUpScheduler(String title, String body, int frequency) {
    Workmanager().registerPeriodicTask(
      'notification', 
      'send_notification',
      frequency: Duration(hours: frequency),
      existingWorkPolicy: .replace,
      inputData: {
        'title': title,
        'body': body,
      }
    );
  }

  @override
  void askForPermission() {
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
  }

  @override
  bool isNotificationAllowed(TimeOfDay now, TimeOfDay wakeUpTime, TimeOfDay sleepTime) {
    bool isNotificationAllowed = 
      (now.isAtSameTimeAs(wakeUpTime) || now.isAfter(wakeUpTime)) && now.isBefore(sleepTime);

    if(sleepTime.hour < wakeUpTime.hour || (sleepTime.hour == wakeUpTime.hour) && (sleepTime.minute < wakeUpTime.minute)) {
      isNotificationAllowed = now.isAfter(wakeUpTime) || now.isBefore(sleepTime);
    }

    return isNotificationAllowed;
  }
}