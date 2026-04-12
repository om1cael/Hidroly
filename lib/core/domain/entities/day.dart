import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';

part 'day.freezed.dart';

@freezed
abstract class Day with _$Day {  
  const factory Day({
    @Default(0) int id,
    required Water dailyGoal,
    @Default(Water.zero()) Water currentAmount,
    required DateTime createdAt,
  }) = _day;
}