// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hydration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HydrationState {

 Day get day;
/// Create a copy of HydrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HydrationStateCopyWith<HydrationState> get copyWith => _$HydrationStateCopyWithImpl<HydrationState>(this as HydrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HydrationState&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'HydrationState(day: $day)';
}


}

/// @nodoc
abstract mixin class $HydrationStateCopyWith<$Res>  {
  factory $HydrationStateCopyWith(HydrationState value, $Res Function(HydrationState) _then) = _$HydrationStateCopyWithImpl;
@useResult
$Res call({
 Day day
});


$DayCopyWith<$Res> get day;

}
/// @nodoc
class _$HydrationStateCopyWithImpl<$Res>
    implements $HydrationStateCopyWith<$Res> {
  _$HydrationStateCopyWithImpl(this._self, this._then);

  final HydrationState _self;
  final $Res Function(HydrationState) _then;

/// Create a copy of HydrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as Day,
  ));
}
/// Create a copy of HydrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayCopyWith<$Res> get day {
  
  return $DayCopyWith<$Res>(_self.day, (value) {
    return _then(_self.copyWith(day: value));
  });
}
}


/// Adds pattern-matching-related methods to [HydrationState].
extension HydrationStatePatterns on HydrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HydrationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HydrationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HydrationState value)  $default,){
final _that = this;
switch (_that) {
case _HydrationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HydrationState value)?  $default,){
final _that = this;
switch (_that) {
case _HydrationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Day day)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HydrationState() when $default != null:
return $default(_that.day);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Day day)  $default,) {final _that = this;
switch (_that) {
case _HydrationState():
return $default(_that.day);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Day day)?  $default,) {final _that = this;
switch (_that) {
case _HydrationState() when $default != null:
return $default(_that.day);case _:
  return null;

}
}

}

/// @nodoc


class _HydrationState implements HydrationState {
  const _HydrationState({required this.day});
  

@override final  Day day;

/// Create a copy of HydrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HydrationStateCopyWith<_HydrationState> get copyWith => __$HydrationStateCopyWithImpl<_HydrationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HydrationState&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'HydrationState(day: $day)';
}


}

/// @nodoc
abstract mixin class _$HydrationStateCopyWith<$Res> implements $HydrationStateCopyWith<$Res> {
  factory _$HydrationStateCopyWith(_HydrationState value, $Res Function(_HydrationState) _then) = __$HydrationStateCopyWithImpl;
@override @useResult
$Res call({
 Day day
});


@override $DayCopyWith<$Res> get day;

}
/// @nodoc
class __$HydrationStateCopyWithImpl<$Res>
    implements _$HydrationStateCopyWith<$Res> {
  __$HydrationStateCopyWithImpl(this._self, this._then);

  final _HydrationState _self;
  final $Res Function(_HydrationState) _then;

/// Create a copy of HydrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,}) {
  return _then(_HydrationState(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as Day,
  ));
}

/// Create a copy of HydrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayCopyWith<$Res> get day {
  
  return $DayCopyWith<$Res>(_self.day, (value) {
    return _then(_self.copyWith(day: value));
  });
}
}

// dart format on
