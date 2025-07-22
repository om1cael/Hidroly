import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateUtils {
  /// Takes a *local* date and returns [YYYY-MM-DD 00:00:00.000].
  static DateTime normalizedLocal(DateTime localDate) {
    localDate = localDate.toLocal();
    
    return DateTime(
      localDate.year,
      localDate.month,
      localDate.day,
    );
  }

  static String formatDayTitle(DateTime localDate, { BuildContext? context, DateTime? now, String todayText = 'Today' }) {
    localDate = localDate.toLocal();
    now ??= DateTime.now();

    if(localDate.day == now.day && localDate.month == now.month && localDate.year == now.year) {
      return todayText;
    }

    final locale = context != null
      ? Localizations.localeOf(context).toString()
      : Intl.getCurrentLocale();

    return DateFormat.yMMMMd(locale).format(localDate);
  }
  
  static String formatTime(int hour, int minutes) {
    return '${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  static TimeOfDay parseTime(String formattedTime) {
    final format = DateFormat.Hm();
    final dateTime = format.parse(formattedTime);
    return TimeOfDay.fromDateTime(dateTime);
  }
}