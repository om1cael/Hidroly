import 'package:easy_localization/easy_localization.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

extension UnitSystemUIX on UnitSystem {
  String get unitLabel => this == UnitSystem.metric ? 'ml'.tr() : 'oz'.tr();
}