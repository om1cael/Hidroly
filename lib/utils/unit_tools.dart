import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';

class UnitTools {
  static const double _lbPerKg = 2.204623;
  static const double _flOzPerMl = 0.03381402;
  static const double _mlPerFlOz = 29.5735;

  static int lbToKg(int lb) {
    return (lb / _lbPerKg).round();
  }

  static double mlToFlOz(int ml) {
    return ml * _flOzPerMl;
  }

  static int flOzToMl(double flOz) {
    return (flOz * _mlPerFlOz).round();
  }

  static String getVolumeWithUnit(int ml, bool isMetric, {BuildContext? context}) {
    final unitLabel = context == null
      ? (isMetric ? 'ml' : 'fl oz')
      : (isMetric ? AppLocalizations.of(context)!.mlUnit : AppLocalizations.of(context)!.flOzUnit);

    if(isMetric) {
      return "$ml $unitLabel";
    } else {
      double flOz = mlToFlOz(ml);
      String formattedFlOz = flOz.toStringAsFixed(1);
      return "$formattedFlOz $unitLabel";
    }
  }
}