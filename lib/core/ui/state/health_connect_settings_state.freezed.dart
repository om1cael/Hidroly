// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_connect_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthConnectSettingsState {

 bool get enabled; bool get askForAppSettingsRedirect; bool get isExporting;
/// Create a copy of HealthConnectSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthConnectSettingsStateCopyWith<HealthConnectSettingsState> get copyWith => _$HealthConnectSettingsStateCopyWithImpl<HealthConnectSettingsState>(this as HealthConnectSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthConnectSettingsState&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.askForAppSettingsRedirect, askForAppSettingsRedirect) || other.askForAppSettingsRedirect == askForAppSettingsRedirect)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,askForAppSettingsRedirect,isExporting);

@override
String toString() {
  return 'HealthConnectSettingsState(enabled: $enabled, askForAppSettingsRedirect: $askForAppSettingsRedirect, isExporting: $isExporting)';
}


}

/// @nodoc
abstract mixin class $HealthConnectSettingsStateCopyWith<$Res>  {
  factory $HealthConnectSettingsStateCopyWith(HealthConnectSettingsState value, $Res Function(HealthConnectSettingsState) _then) = _$HealthConnectSettingsStateCopyWithImpl;
@useResult
$Res call({
 bool enabled, bool askForAppSettingsRedirect, bool isExporting
});




}
/// @nodoc
class _$HealthConnectSettingsStateCopyWithImpl<$Res>
    implements $HealthConnectSettingsStateCopyWith<$Res> {
  _$HealthConnectSettingsStateCopyWithImpl(this._self, this._then);

  final HealthConnectSettingsState _self;
  final $Res Function(HealthConnectSettingsState) _then;

/// Create a copy of HealthConnectSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? askForAppSettingsRedirect = null,Object? isExporting = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,askForAppSettingsRedirect: null == askForAppSettingsRedirect ? _self.askForAppSettingsRedirect : askForAppSettingsRedirect // ignore: cast_nullable_to_non_nullable
as bool,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthConnectSettingsState].
extension HealthConnectSettingsStatePatterns on HealthConnectSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthConnectSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthConnectSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthConnectSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _HealthConnectSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthConnectSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _HealthConnectSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  bool askForAppSettingsRedirect,  bool isExporting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthConnectSettingsState() when $default != null:
return $default(_that.enabled,_that.askForAppSettingsRedirect,_that.isExporting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  bool askForAppSettingsRedirect,  bool isExporting)  $default,) {final _that = this;
switch (_that) {
case _HealthConnectSettingsState():
return $default(_that.enabled,_that.askForAppSettingsRedirect,_that.isExporting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  bool askForAppSettingsRedirect,  bool isExporting)?  $default,) {final _that = this;
switch (_that) {
case _HealthConnectSettingsState() when $default != null:
return $default(_that.enabled,_that.askForAppSettingsRedirect,_that.isExporting);case _:
  return null;

}
}

}

/// @nodoc


class _HealthConnectSettingsState implements HealthConnectSettingsState {
  const _HealthConnectSettingsState({this.enabled = false, this.askForAppSettingsRedirect = false, this.isExporting = false});
  

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  bool askForAppSettingsRedirect;
@override@JsonKey() final  bool isExporting;

/// Create a copy of HealthConnectSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthConnectSettingsStateCopyWith<_HealthConnectSettingsState> get copyWith => __$HealthConnectSettingsStateCopyWithImpl<_HealthConnectSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthConnectSettingsState&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.askForAppSettingsRedirect, askForAppSettingsRedirect) || other.askForAppSettingsRedirect == askForAppSettingsRedirect)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,askForAppSettingsRedirect,isExporting);

@override
String toString() {
  return 'HealthConnectSettingsState(enabled: $enabled, askForAppSettingsRedirect: $askForAppSettingsRedirect, isExporting: $isExporting)';
}


}

/// @nodoc
abstract mixin class _$HealthConnectSettingsStateCopyWith<$Res> implements $HealthConnectSettingsStateCopyWith<$Res> {
  factory _$HealthConnectSettingsStateCopyWith(_HealthConnectSettingsState value, $Res Function(_HealthConnectSettingsState) _then) = __$HealthConnectSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, bool askForAppSettingsRedirect, bool isExporting
});




}
/// @nodoc
class __$HealthConnectSettingsStateCopyWithImpl<$Res>
    implements _$HealthConnectSettingsStateCopyWith<$Res> {
  __$HealthConnectSettingsStateCopyWithImpl(this._self, this._then);

  final _HealthConnectSettingsState _self;
  final $Res Function(_HealthConnectSettingsState) _then;

/// Create a copy of HealthConnectSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? askForAppSettingsRedirect = null,Object? isExporting = null,}) {
  return _then(_HealthConnectSettingsState(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,askForAppSettingsRedirect: null == askForAppSettingsRedirect ? _self.askForAppSettingsRedirect : askForAppSettingsRedirect // ignore: cast_nullable_to_non_nullable
as bool,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
