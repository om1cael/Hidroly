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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetupState()';
}


}

/// @nodoc
class $SetupStateCopyWith<$Res>  {
$SetupStateCopyWith(SetupState _, $Res Function(SetupState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Profile value)?  profile,TResult Function( _Notifications value)?  notifications,TResult Function( _Processing value)?  processing,TResult Function( _Done value)?  done,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when profile != null:
return profile(_that);case _Notifications() when notifications != null:
return notifications(_that);case _Processing() when processing != null:
return processing(_that);case _Done() when done != null:
return done(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Profile value)  profile,required TResult Function( _Notifications value)  notifications,required TResult Function( _Processing value)  processing,required TResult Function( _Done value)  done,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Profile():
return profile(_that);case _Notifications():
return notifications(_that);case _Processing():
return processing(_that);case _Done():
return done(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Profile value)?  profile,TResult? Function( _Notifications value)?  notifications,TResult? Function( _Processing value)?  processing,TResult? Function( _Done value)?  done,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Profile() when profile != null:
return profile(_that);case _Notifications() when notifications != null:
return notifications(_that);case _Processing() when processing != null:
return processing(_that);case _Done() when done != null:
return done(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  profile,TResult Function()?  notifications,TResult Function()?  processing,TResult Function( bool dailyGoalClamped)?  done,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when profile != null:
return profile();case _Notifications() when notifications != null:
return notifications();case _Processing() when processing != null:
return processing();case _Done() when done != null:
return done(_that.dailyGoalClamped);case _Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  profile,required TResult Function()  notifications,required TResult Function()  processing,required TResult Function( bool dailyGoalClamped)  done,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Profile():
return profile();case _Notifications():
return notifications();case _Processing():
return processing();case _Done():
return done(_that.dailyGoalClamped);case _Error():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  profile,TResult? Function()?  notifications,TResult? Function()?  processing,TResult? Function( bool dailyGoalClamped)?  done,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Profile() when profile != null:
return profile();case _Notifications() when notifications != null:
return notifications();case _Processing() when processing != null:
return processing();case _Done() when done != null:
return done(_that.dailyGoalClamped);case _Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Profile implements SetupState {
  const _Profile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetupState.profile()';
}


}




/// @nodoc


class _Notifications implements SetupState {
  const _Notifications();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Notifications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetupState.notifications()';
}


}




/// @nodoc


class _Processing implements SetupState {
  const _Processing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SetupState.processing()';
}


}




/// @nodoc


class _Done implements SetupState {
  const _Done({this.dailyGoalClamped = false});
  

@JsonKey() final  bool dailyGoalClamped;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoneCopyWith<_Done> get copyWith => __$DoneCopyWithImpl<_Done>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Done&&(identical(other.dailyGoalClamped, dailyGoalClamped) || other.dailyGoalClamped == dailyGoalClamped));
}


@override
int get hashCode => Object.hash(runtimeType,dailyGoalClamped);

@override
String toString() {
  return 'SetupState.done(dailyGoalClamped: $dailyGoalClamped)';
}


}

/// @nodoc
abstract mixin class _$DoneCopyWith<$Res> implements $SetupStateCopyWith<$Res> {
  factory _$DoneCopyWith(_Done value, $Res Function(_Done) _then) = __$DoneCopyWithImpl;
@useResult
$Res call({
 bool dailyGoalClamped
});




}
/// @nodoc
class __$DoneCopyWithImpl<$Res>
    implements _$DoneCopyWith<$Res> {
  __$DoneCopyWithImpl(this._self, this._then);

  final _Done _self;
  final $Res Function(_Done) _then;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dailyGoalClamped = null,}) {
  return _then(_Done(
dailyGoalClamped: null == dailyGoalClamped ? _self.dailyGoalClamped : dailyGoalClamped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements SetupState {
  const _Error(this.error);
  

 final  String error;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SetupState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SetupStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
