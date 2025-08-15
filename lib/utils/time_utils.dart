import 'package:flutter/widgets.dart';
import 'package:hidroly/l10n/app_localizations.dart';

class TimeUtils {
  static String getTimeString(int minutes, BuildContext context) {
    int hours = minutes ~/ 60;

    if(minutes < 60) {
      return AppLocalizations.of(context)!.minutes(
        minutes.toString()
      );
    } else if(minutes < 120) {
      return AppLocalizations.of(context)!.hour(
        hours.toString()
      );
    } else {
      return AppLocalizations.of(context)!.hours(
        hours.toString()
      );
    }
  }
}