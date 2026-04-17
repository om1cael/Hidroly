import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_state.freezed.dart';

@freezed
abstract class SummaryState with _$SummaryState {
  const factory SummaryState({
    @Default(0) int totalDrunk,
    @Default(0) int dailyAverage,
    @Default(0) int streak,
  }) = _SummaryState;
}