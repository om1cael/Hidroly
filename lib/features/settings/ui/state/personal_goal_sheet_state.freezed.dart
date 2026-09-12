// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_goal_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonalGoalSheetState {

 UnitSystem get unitSystem; bool get goalOutsideBoundaries; bool get isSaving;
/// Create a copy of PersonalGoalSheetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalGoalSheetStateCopyWith<PersonalGoalSheetState> get copyWith => _$PersonalGoalSheetStateCopyWithImpl<PersonalGoalSheetState>(this as PersonalGoalSheetState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalGoalSheetState&&(identical(other.unitSystem, unitSystem) || other.unitSystem == unitSystem)&&(identical(other.goalOutsideBoundaries, goalOutsideBoundaries) || other.goalOutsideBoundaries == goalOutsideBoundaries)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}


@override
int get hashCode => Object.hash(runtimeType,unitSystem,goalOutsideBoundaries,isSaving);

@override
String toString() {
  return 'PersonalGoalSheetState(unitSystem: $unitSystem, goalOutsideBoundaries: $goalOutsideBoundaries, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class $PersonalGoalSheetStateCopyWith<$Res>  {
  factory $PersonalGoalSheetStateCopyWith(PersonalGoalSheetState value, $Res Function(PersonalGoalSheetState) _then) = _$PersonalGoalSheetStateCopyWithImpl;
@useResult
$Res call({
 UnitSystem unitSystem, bool goalOutsideBoundaries, bool isSaving
});




}
/// @nodoc
class _$PersonalGoalSheetStateCopyWithImpl<$Res>
    implements $PersonalGoalSheetStateCopyWith<$Res> {
  _$PersonalGoalSheetStateCopyWithImpl(this._self, this._then);

  final PersonalGoalSheetState _self;
  final $Res Function(PersonalGoalSheetState) _then;

/// Create a copy of PersonalGoalSheetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitSystem = null,Object? goalOutsideBoundaries = null,Object? isSaving = null,}) {
  return _then(_self.copyWith(
unitSystem: null == unitSystem ? _self.unitSystem : unitSystem // ignore: cast_nullable_to_non_nullable
as UnitSystem,goalOutsideBoundaries: null == goalOutsideBoundaries ? _self.goalOutsideBoundaries : goalOutsideBoundaries // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalGoalSheetState].
extension PersonalGoalSheetStatePatterns on PersonalGoalSheetState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalGoalSheetState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalGoalSheetState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalGoalSheetState value)  $default,){
final _that = this;
switch (_that) {
case _PersonalGoalSheetState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalGoalSheetState value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalGoalSheetState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UnitSystem unitSystem,  bool goalOutsideBoundaries,  bool isSaving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalGoalSheetState() when $default != null:
return $default(_that.unitSystem,_that.goalOutsideBoundaries,_that.isSaving);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UnitSystem unitSystem,  bool goalOutsideBoundaries,  bool isSaving)  $default,) {final _that = this;
switch (_that) {
case _PersonalGoalSheetState():
return $default(_that.unitSystem,_that.goalOutsideBoundaries,_that.isSaving);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UnitSystem unitSystem,  bool goalOutsideBoundaries,  bool isSaving)?  $default,) {final _that = this;
switch (_that) {
case _PersonalGoalSheetState() when $default != null:
return $default(_that.unitSystem,_that.goalOutsideBoundaries,_that.isSaving);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalGoalSheetState implements PersonalGoalSheetState {
  const _PersonalGoalSheetState({this.unitSystem = UnitSystem.metric, this.goalOutsideBoundaries = false, this.isSaving = false});
  

@override@JsonKey() final  UnitSystem unitSystem;
@override@JsonKey() final  bool goalOutsideBoundaries;
@override@JsonKey() final  bool isSaving;

/// Create a copy of PersonalGoalSheetState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalGoalSheetStateCopyWith<_PersonalGoalSheetState> get copyWith => __$PersonalGoalSheetStateCopyWithImpl<_PersonalGoalSheetState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalGoalSheetState&&(identical(other.unitSystem, unitSystem) || other.unitSystem == unitSystem)&&(identical(other.goalOutsideBoundaries, goalOutsideBoundaries) || other.goalOutsideBoundaries == goalOutsideBoundaries)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}


@override
int get hashCode => Object.hash(runtimeType,unitSystem,goalOutsideBoundaries,isSaving);

@override
String toString() {
  return 'PersonalGoalSheetState(unitSystem: $unitSystem, goalOutsideBoundaries: $goalOutsideBoundaries, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class _$PersonalGoalSheetStateCopyWith<$Res> implements $PersonalGoalSheetStateCopyWith<$Res> {
  factory _$PersonalGoalSheetStateCopyWith(_PersonalGoalSheetState value, $Res Function(_PersonalGoalSheetState) _then) = __$PersonalGoalSheetStateCopyWithImpl;
@override @useResult
$Res call({
 UnitSystem unitSystem, bool goalOutsideBoundaries, bool isSaving
});




}
/// @nodoc
class __$PersonalGoalSheetStateCopyWithImpl<$Res>
    implements _$PersonalGoalSheetStateCopyWith<$Res> {
  __$PersonalGoalSheetStateCopyWithImpl(this._self, this._then);

  final _PersonalGoalSheetState _self;
  final $Res Function(_PersonalGoalSheetState) _then;

/// Create a copy of PersonalGoalSheetState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitSystem = null,Object? goalOutsideBoundaries = null,Object? isSaving = null,}) {
  return _then(_PersonalGoalSheetState(
unitSystem: null == unitSystem ? _self.unitSystem : unitSystem // ignore: cast_nullable_to_non_nullable
as UnitSystem,goalOutsideBoundaries: null == goalOutsideBoundaries ? _self.goalOutsideBoundaries : goalOutsideBoundaries // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
