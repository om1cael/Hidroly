import 'package:freezed_annotation/freezed_annotation.dart';

part 'migration_state.freezed.dart';

@freezed
abstract class MigrationState with _$MigrationState {
  factory MigrationState.initial() = _Initial;
  
  factory MigrationState.processing() = _Processing;

  factory MigrationState.done() = _Done;

  factory MigrationState.error({required String error}) = _Error;
}