import 'package:easy_localization/easy_localization.dart';

extension DateTimeFormatting on DateTime {
  String toRelativeDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);

    if (dateToCheck == today) {
      return 'today'.tr();
    } else if (dateToCheck == yesterday) {
      return 'yesterday'.tr();
    } else {
      return DateFormat.yMMMMd().format(this);
    }
  }
}