import 'package:freezed_annotation/freezed_annotation.dart';

part 'cup.freezed.dart';

@freezed
abstract class Cup with _$Cup {
  const factory Cup({
    @Default(0) int id,
    required int dayId,
    required int amount,
    required DateTime createdAt,
  }) = _cup;
}