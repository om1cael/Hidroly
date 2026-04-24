// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationSettingsState {

 TimeOfDay get wakeUpTime; TimeOfDay get sleepTime; int get notificationFrequency;
/// Create a copy of NotificationSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationSettingsStateCopyWith<NotificationSettingsState> get copyWith => _$NotificationSettingsStateCopyWithImpl<NotificationSettingsState>(this as NotificationSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSettingsState&&(identical(other.wakeUpTime, wakeUpTime) || other.wakeUpTime == wakeUpTime)&&(identical(other.sleepTime, sleepTime) || other.sleepTime == sleepTime)&&(identical(other.notificationFrequency, notificationFrequency) || other.notificationFrequency == notificationFrequency));
}


@override
int get hashCode => Object.hash(runtimeType,wakeUpTime,sleepTime,notificationFrequency);

@override
String toString() {
  return 'NotificationSettingsState(wakeUpTime: $wakeUpTime, sleepTime: $sleepTime, notificationFrequency: $notificationFrequency)';
}


}

/// @nodoc
abstract mixin class $NotificationSettingsStateCopyWith<$Res>  {
  factory $NotificationSettingsStateCopyWith(NotificationSettingsState value, $Res Function(NotificationSettingsState) _then) = _$NotificationSettingsStateCopyWithImpl;
@useResult
$Res call({
 TimeOfDay wakeUpTime, TimeOfDay sleepTime, int notificationFrequency
});




}
/// @nodoc
class _$NotificationSettingsStateCopyWithImpl<$Res>
    implements $NotificationSettingsStateCopyWith<$Res> {
  _$NotificationSettingsStateCopyWithImpl(this._self, this._then);

  final NotificationSettingsState _self;
  final $Res Function(NotificationSettingsState) _then;

/// Create a copy of NotificationSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wakeUpTime = null,Object? sleepTime = null,Object? notificationFrequency = null,}) {
  return _then(_self.copyWith(
wakeUpTime: null == wakeUpTime ? _self.wakeUpTime : wakeUpTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,sleepTime: null == sleepTime ? _self.sleepTime : sleepTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,notificationFrequency: null == notificationFrequency ? _self.notificationFrequency : notificationFrequency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationSettingsState].
extension NotificationSettingsStatePatterns on NotificationSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimeOfDay wakeUpTime,  TimeOfDay sleepTime,  int notificationFrequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationSettingsState() when $default != null:
return $default(_that.wakeUpTime,_that.sleepTime,_that.notificationFrequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimeOfDay wakeUpTime,  TimeOfDay sleepTime,  int notificationFrequency)  $default,) {final _that = this;
switch (_that) {
case _NotificationSettingsState():
return $default(_that.wakeUpTime,_that.sleepTime,_that.notificationFrequency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimeOfDay wakeUpTime,  TimeOfDay sleepTime,  int notificationFrequency)?  $default,) {final _that = this;
switch (_that) {
case _NotificationSettingsState() when $default != null:
return $default(_that.wakeUpTime,_that.sleepTime,_that.notificationFrequency);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationSettingsState implements NotificationSettingsState {
  const _NotificationSettingsState({this.wakeUpTime = const TimeOfDay(hour: 8, minute: 0), this.sleepTime = const TimeOfDay(hour: 21, minute: 0), this.notificationFrequency = 2});
  

@override@JsonKey() final  TimeOfDay wakeUpTime;
@override@JsonKey() final  TimeOfDay sleepTime;
@override@JsonKey() final  int notificationFrequency;

/// Create a copy of NotificationSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationSettingsStateCopyWith<_NotificationSettingsState> get copyWith => __$NotificationSettingsStateCopyWithImpl<_NotificationSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSettingsState&&(identical(other.wakeUpTime, wakeUpTime) || other.wakeUpTime == wakeUpTime)&&(identical(other.sleepTime, sleepTime) || other.sleepTime == sleepTime)&&(identical(other.notificationFrequency, notificationFrequency) || other.notificationFrequency == notificationFrequency));
}


@override
int get hashCode => Object.hash(runtimeType,wakeUpTime,sleepTime,notificationFrequency);

@override
String toString() {
  return 'NotificationSettingsState(wakeUpTime: $wakeUpTime, sleepTime: $sleepTime, notificationFrequency: $notificationFrequency)';
}


}

/// @nodoc
abstract mixin class _$NotificationSettingsStateCopyWith<$Res> implements $NotificationSettingsStateCopyWith<$Res> {
  factory _$NotificationSettingsStateCopyWith(_NotificationSettingsState value, $Res Function(_NotificationSettingsState) _then) = __$NotificationSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 TimeOfDay wakeUpTime, TimeOfDay sleepTime, int notificationFrequency
});




}
/// @nodoc
class __$NotificationSettingsStateCopyWithImpl<$Res>
    implements _$NotificationSettingsStateCopyWith<$Res> {
  __$NotificationSettingsStateCopyWithImpl(this._self, this._then);

  final _NotificationSettingsState _self;
  final $Res Function(_NotificationSettingsState) _then;

/// Create a copy of NotificationSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wakeUpTime = null,Object? sleepTime = null,Object? notificationFrequency = null,}) {
  return _then(_NotificationSettingsState(
wakeUpTime: null == wakeUpTime ? _self.wakeUpTime : wakeUpTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,sleepTime: null == sleepTime ? _self.sleepTime : sleepTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,notificationFrequency: null == notificationFrequency ? _self.notificationFrequency : notificationFrequency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
