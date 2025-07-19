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
}