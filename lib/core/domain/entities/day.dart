import 'package:freezed_annotation/freezed_annotation.dart';

part 'day.freezed.dart';

@freezed
abstract class Day with _$Day {  
  const factory Day({
    @Default(0) int id,
    required int dailyGoal,
    @Default(0) int currentAmount,
    required DateTime createdAt,
  }) = _day;
}