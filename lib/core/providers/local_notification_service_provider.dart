import 'package:hidroly/core/domain/interfaces/notification_service.dart';
import 'package:hidroly/infra/notifications/local_notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_notification_service_provider.g.dart';

@riverpod
NotificationService localNotificationService(Ref ref) {
  return LocalNotificationService();
}