// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SetupState {

 SetupResult get setupResult; Set<UnitSystem> get unit; String? get errorText; bool get dailyGoalClamped; bool get isLoading;
/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetupStateCopyWith<SetupState> get copyWith => _$SetupStateCopyWithImpl<SetupState>(this as SetupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetupState&&(identical(other.setupResult, setupResult) || other.setupResult == setupResult)&&const DeepCollectionEquality().equals(other.unit, unit)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.dailyGoalClamped, dailyGoalClamped) || other.dailyGoalClamped == dailyGoalClamped)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,setupResult,const DeepCollectionEquality().hash(unit),errorText,dailyGoalClamped,isLoading);

@override
String toString() {
  return 'SetupState(setupResult: $setupResult, unit: $unit, errorText: $errorText, dailyGoalClamped: $dailyGoalClamped, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SetupStateCopyWith<$Res>  {
  factory $SetupStateCopyWith(SetupState value, $Res Function(SetupState) _then) = _$SetupStateCopyWithImpl;
@useResult
$Res call({
 SetupResult setupResult, Set<UnitSystem> unit, String? errorText, bool dailyGoalClamped, bool isLoading
});




}
/// @nodoc
class _$SetupStateCopyWithImpl<$Res>
    implements $SetupStateCopyWith<$Res> {
  _$SetupStateCopyWithImpl(this._self, this._then);

  final SetupState _self;
  final $Res Function(SetupState) _then;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setupResult = null,Object? unit = null,Object? errorText = freezed,Object? dailyGoalClamped = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
setupResult: null == setupResult ? _self.setupResult : setupResult // ignore: cast_nullable_to_non_nullable
as SetupResult,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Set<UnitSystem>,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,dailyGoalClamped: null == dailyGoalClamped ? _self.dailyGoalClamped : dailyGoalClamped // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SetupState].
extension SetupStatePatterns on SetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetupState value)  $default,){
final _that = this;
switch (_that) {
case _SetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetupState value)?  $default,){
final _that = this;
switch (_that) {
case _SetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SetupResult setupResult,  Set<UnitSystem> unit,  String? errorText,  bool dailyGoalClamped,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetupState() when $default != null:
return $default(_that.setupResult,_that.unit,_that.errorText,_that.dailyGoalClamped,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SetupResult setupResult,  Set<UnitSystem> unit,  String? errorText,  bool dailyGoalClamped,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SetupState():
return $default(_that.setupResult,_that.unit,_that.errorText,_that.dailyGoalClamped,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SetupResult setupResult,  Set<UnitSystem> unit,  String? errorText,  bool dailyGoalClamped,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SetupState() when $default != null:
return $default(_that.setupResult,_that.unit,_that.errorText,_that.dailyGoalClamped,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SetupState implements SetupState {
  const _SetupState({this.setupResult = SetupResult.idle, required final  Set<UnitSystem> unit, this.errorText, this.dailyGoalClamped = false, this.isLoading = false}): _unit = unit;
  

@override@JsonKey() final  SetupResult setupResult;
 final  Set<UnitSystem> _unit;
@override Set<UnitSystem> get unit {
  if (_unit is EqualUnmodifiableSetView) return _unit;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unit);
}

@override final  String? errorText;
@override@JsonKey() final  bool dailyGoalClamped;
@override@JsonKey() final  bool isLoading;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetupStateCopyWith<_SetupState> get copyWith => __$SetupStateCopyWithImpl<_SetupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetupState&&(identical(other.setupResult, setupResult) || other.setupResult == setupResult)&&const DeepCollectionEquality().equals(other._unit, _unit)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.dailyGoalClamped, dailyGoalClamped) || other.dailyGoalClamped == dailyGoalClamped)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,setupResult,const DeepCollectionEquality().hash(_unit),errorText,dailyGoalClamped,isLoading);

@override
String toString() {
  return 'SetupState(setupResult: $setupResult, unit: $unit, errorText: $errorText, dailyGoalClamped: $dailyGoalClamped, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SetupStateCopyWith<$Res> implements $SetupStateCopyWith<$Res> {
  factory _$SetupStateCopyWith(_SetupState value, $Res Function(_SetupState) _then) = __$SetupStateCopyWithImpl;
@override @useResult
$Res call({
 SetupResult setupResult, Set<UnitSystem> unit, String? errorText, bool dailyGoalClamped, bool isLoading
});




}
/// @nodoc
class __$SetupStateCopyWithImpl<$Res>
    implements _$SetupStateCopyWith<$Res> {
  __$SetupStateCopyWithImpl(this._self, this._then);

  final _SetupState _self;
  final $Res Function(_SetupState) _then;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setupResult = null,Object? unit = null,Object? errorText = freezed,Object? dailyGoalClamped = null,Object? isLoading = null,}) {
  return _then(_SetupState(
setupResult: null == setupResult ? _self.setupResult : setupResult // ignore: cast_nullable_to_non_nullable
as SetupResult,unit: null == unit ? _self._unit : unit // ignore: cast_nullable_to_non_nullable
as Set<UnitSystem>,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,dailyGoalClamped: null == dailyGoalClamped ? _self.dailyGoalClamped : dailyGoalClamped // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
