import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_item.freezed.dart';

@freezed
abstract class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    @Default(1) int id,
    required int dayId,
    required int amount,
    required DateTime createdAt,
  }) = _HistoryItem;
}