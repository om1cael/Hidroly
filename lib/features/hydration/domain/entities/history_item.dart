import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';

part 'history_item.freezed.dart';

@freezed
abstract class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    @Default(1) int id,
    required int dayId,
    required Water amount,
    required DateTime createdAt,
  }) = _HistoryItem;
}