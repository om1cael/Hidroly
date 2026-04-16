import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';

part 'cup.freezed.dart';

@freezed
abstract class Cup with _$Cup {
  const factory Cup({
    @Default(0) int id,
    required CupValue amount,
    required DateTime createdAt,
  }) = _cup;
}