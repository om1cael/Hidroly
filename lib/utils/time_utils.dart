import 'package:flutter/widgets.dart';
import 'package:hidroly/l10n/app_localizations.dart';

class TimeUtils {
  static String getTimeString(int minutes, BuildContext context) {
    if(minutes < 60) {
      return AppLocalizations.of(context)!.minutes(
        minutes.toString()
      );
    } else if(minutes < 120) {
      return AppLocalizations.of(context)!.hour(
        minutes.toString()
      );
    } else {
      return AppLocalizations.of(context)!.hours(
        minutes.toString()
      );
    }
  }
}