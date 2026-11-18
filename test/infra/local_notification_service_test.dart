import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/infra/notifications/local_notification_service.dart';
import 'package:test/test.dart';

void main() {
  late LocalNotificationService service;

  setUpAll(() {
    service = LocalNotificationService();
  });

  group('Notification water input tests', () {
    test('parses metric milliliters', () {
      expect(
        waterAmountFromNotificationInput('250', UnitSystem.metric),
        250,
      );
    });

    test('accepts a decimal comma for metric amounts', () {
      expect(
        waterAmountFromNotificationInput('250,5', UnitSystem.metric),
        251,
      );
    });

    test('converts imperial ounces to milliliters', () {
      expect(
        waterAmountFromNotificationInput('8', UnitSystem.imperial),
        237,
      );
    });

    test('rejects empty, non-numeric, zero, and negative amounts', () {
      expect(waterAmountFromNotificationInput('', UnitSystem.metric), isNull);
      expect(waterAmountFromNotificationInput('water', UnitSystem.metric), isNull);
      expect(waterAmountFromNotificationInput('0', UnitSystem.metric), isNull);
      expect(waterAmountFromNotificationInput('-10', UnitSystem.metric), isNull);
    });
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
