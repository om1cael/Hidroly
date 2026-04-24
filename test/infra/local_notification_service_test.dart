import 'package:flutter/material.dart';
import 'package:hidroly/infra/notifications/local_notification_service.dart';
import 'package:test/test.dart';

void main() {
  late LocalNotificationService service;

  setUpAll(() {
    service = LocalNotificationService();
  });

  group('Notification Allow tests', () {
    test('Should allow if is on range', () {
      TimeOfDay now = TimeOfDay(hour: 12, minute: 0);
      TimeOfDay wakeUpTime = TimeOfDay(hour: 8, minute: 0);
      TimeOfDay sleepTime = TimeOfDay(hour: 20, minute: 0);

      final allowed = service.isNotificationAllowed(now, wakeUpTime, sleepTime);
      expect(allowed, isTrue);
    });
    test('Should not allow if is out of range', () {
      TimeOfDay now = TimeOfDay(hour: 6, minute: 0);
      TimeOfDay wakeUpTime = TimeOfDay(hour: 8, minute: 0);
      TimeOfDay sleepTime = TimeOfDay(hour: 20, minute: 0);

      final allowed = service.isNotificationAllowed(now, wakeUpTime, sleepTime);
      expect(allowed, isFalse);
    });
    test('Should work overnight', () {
      TimeOfDay now = TimeOfDay(hour: 0, minute: 0);
      TimeOfDay wakeUpTime = TimeOfDay(hour: 22, minute: 0);
      TimeOfDay sleepTime = TimeOfDay(hour: 04, minute: 0);

      final allowed = service.isNotificationAllowed(now, wakeUpTime, sleepTime);
      expect(allowed, isTrue);
    });
    test('Should work when only minutes are different', () {
      TimeOfDay now = TimeOfDay(hour: 8, minute: 0);
      TimeOfDay wakeUpTime = TimeOfDay(hour: 8, minute: 30);
      TimeOfDay sleepTime = TimeOfDay(hour: 8, minute: 25);

      final allowed = service.isNotificationAllowed(now, wakeUpTime, sleepTime);
      expect(allowed, isTrue);
    });
  });
}