import 'package:hidroly/core/domain/enums/unit_systems.dart';

abstract class NotificationService {
  Future<void> initialize();
  Future<void> showNotification(UnitSystem unitSystem);
  void askForPermission();
}