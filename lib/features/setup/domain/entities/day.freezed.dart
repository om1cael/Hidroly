// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Day {

 int get id; int get dailyGoal; int get currentAmount;
/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayCopyWith<Day> get copyWith => _$DayCopyWithImpl<Day>(this as Day, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Day&&(identical(other.id, id) || other.id == id)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount));
}


@override
int get hashCode => Object.hash(runtimeType,id,dailyGoal,currentAmount);

@override
String toString() {
  return 'Day(id: $id, dailyGoal: $dailyGoal, currentAmount: $currentAmount)';
}


}

/// @nodoc
abstract mixin class $DayCopyWith<$Res>  {
  factory $DayCopyWith(Day value, $Res Function(Day) _then) = _$DayCopyWithImpl;
@useResult
$Res call({
 int id, int dailyGoal, int currentAmount
});




}
/// @nodoc
class _$DayCopyWithImpl<$Res>
    implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._self, this._then);

  final Day _self;
  final $Res Function(Day) _then;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dailyGoal = null,Object? currentAmount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as int,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Day].
extension DayPatterns on Day {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _day value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _day() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _day value)  $default,){
final _that = this;
switch (_that) {
case _day():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _day value)?  $default,){
final _that = this;
switch (_that) {
case _day() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int dailyGoal,  int currentAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _day() when $default != null:
return $default(_that.id,_that.dailyGoal,_that.currentAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int dailyGoal,  int currentAmount)  $default,) {final _that = this;
switch (_that) {
case _day():
return $default(_that.id,_that.dailyGoal,_that.currentAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int dailyGoal,  int currentAmount)?  $default,) {final _that = this;
switch (_that) {
case _day() when $default != null:
return $default(_that.id,_that.dailyGoal,_that.currentAmount);case _:
  return null;

}
}

}

/// @nodoc


class _day implements Day {
  const _day({this.id = 0, required this.dailyGoal, this.currentAmount = 0});
  

@override@JsonKey() final  int id;
@override final  int dailyGoal;
@override@JsonKey() final  int currentAmount;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$dayCopyWith<_day> get copyWith => __$dayCopyWithImpl<_day>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _day&&(identical(other.id, id) || other.id == id)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount));
}


@override
int get hashCode => Object.hash(runtimeType,id,dailyGoal,currentAmount);

@override
String toString() {
  return 'Day(id: $id, dailyGoal: $dailyGoal, currentAmount: $currentAmount)';
}


}

/// @nodoc
abstract mixin class _$dayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$dayCopyWith(_day value, $Res Function(_day) _then) = __$dayCopyWithImpl;
@override @useResult
$Res call({
 int id, int dailyGoal, int currentAmount
});




}
/// @nodoc
class __$dayCopyWithImpl<$Res>
    implements _$dayCopyWith<$Res> {
  __$dayCopyWithImpl(this._self, this._then);

  final _day _self;
  final $Res Function(_day) _then;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dailyGoal = null,Object? currentAmount = null,}) {
  return _then(_day(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as int,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
