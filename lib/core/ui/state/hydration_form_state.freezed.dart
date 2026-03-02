// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hydration_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HydrationFormState {

 Set<UnitSystem> get unit;
/// Create a copy of HydrationFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HydrationFormStateCopyWith<HydrationFormState> get copyWith => _$HydrationFormStateCopyWithImpl<HydrationFormState>(this as HydrationFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HydrationFormState&&const DeepCollectionEquality().equals(other.unit, unit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(unit));

@override
String toString() {
  return 'HydrationFormState(unit: $unit)';
}


}

/// @nodoc
abstract mixin class $HydrationFormStateCopyWith<$Res>  {
  factory $HydrationFormStateCopyWith(HydrationFormState value, $Res Function(HydrationFormState) _then) = _$HydrationFormStateCopyWithImpl;
@useResult
$Res call({
 Set<UnitSystem> unit
});




}
/// @nodoc
class _$HydrationFormStateCopyWithImpl<$Res>
    implements $HydrationFormStateCopyWith<$Res> {
  _$HydrationFormStateCopyWithImpl(this._self, this._then);

  final HydrationFormState _self;
  final $Res Function(HydrationFormState) _then;

/// Create a copy of HydrationFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unit = null,}) {
  return _then(_self.copyWith(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as Set<UnitSystem>,
  ));
}

}


/// Adds pattern-matching-related methods to [HydrationFormState].
extension HydrationFormStatePatterns on HydrationFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HydrationFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HydrationFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HydrationFormState value)  $default,){
final _that = this;
switch (_that) {
case _HydrationFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HydrationFormState value)?  $default,){
final _that = this;
switch (_that) {
case _HydrationFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<UnitSystem> unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HydrationFormState() when $default != null:
return $default(_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<UnitSystem> unit)  $default,) {final _that = this;
switch (_that) {
case _HydrationFormState():
return $default(_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<UnitSystem> unit)?  $default,) {final _that = this;
switch (_that) {
case _HydrationFormState() when $default != null:
return $default(_that.unit);case _:
  return null;

}
}

}

/// @nodoc


class _HydrationFormState implements HydrationFormState {
  const _HydrationFormState({required final  Set<UnitSystem> unit}): _unit = unit;
  

 final  Set<UnitSystem> _unit;
@override Set<UnitSystem> get unit {
  if (_unit is EqualUnmodifiableSetView) return _unit;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unit);
}


/// Create a copy of HydrationFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HydrationFormStateCopyWith<_HydrationFormState> get copyWith => __$HydrationFormStateCopyWithImpl<_HydrationFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HydrationFormState&&const DeepCollectionEquality().equals(other._unit, _unit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_unit));

@override
String toString() {
  return 'HydrationFormState(unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$HydrationFormStateCopyWith<$Res> implements $HydrationFormStateCopyWith<$Res> {
  factory _$HydrationFormStateCopyWith(_HydrationFormState value, $Res Function(_HydrationFormState) _then) = __$HydrationFormStateCopyWithImpl;
@override @useResult
$Res call({
 Set<UnitSystem> unit
});




}
/// @nodoc
class __$HydrationFormStateCopyWithImpl<$Res>
    implements _$HydrationFormStateCopyWith<$Res> {
  __$HydrationFormStateCopyWithImpl(this._self, this._then);

  final _HydrationFormState _self;
  final $Res Function(_HydrationFormState) _then;

/// Create a copy of HydrationFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unit = null,}) {
  return _then(_HydrationFormState(
unit: null == unit ? _self._unit : unit // ignore: cast_nullable_to_non_nullable
as Set<UnitSystem>,
  ));
}


}

// dart format on
