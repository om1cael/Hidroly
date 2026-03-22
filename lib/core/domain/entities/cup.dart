import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/entities/day.dart';

part 'cup.freezed.dart';

@freezed
abstract class Cup with _$Cup {
  const factory Cup({
    @Default(0) int id,
    required Day day,
    required int amount,
    required DateTime createdAt,
  }) = _cup;
}