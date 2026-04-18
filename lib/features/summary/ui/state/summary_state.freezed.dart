// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummaryState {

 Water get totalDrunk; Water get dailyAverage; int get streak; UnitSystem get unitSystem; ChartSelection get chartSelection;
/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryStateCopyWith<SummaryState> get copyWith => _$SummaryStateCopyWithImpl<SummaryState>(this as SummaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryState&&(identical(other.totalDrunk, totalDrunk) || other.totalDrunk == totalDrunk)&&(identical(other.dailyAverage, dailyAverage) || other.dailyAverage == dailyAverage)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.unitSystem, unitSystem) || other.unitSystem == unitSystem)&&(identical(other.chartSelection, chartSelection) || other.chartSelection == chartSelection));
}


@override
int get hashCode => Object.hash(runtimeType,totalDrunk,dailyAverage,streak,unitSystem,chartSelection);

@override
String toString() {
  return 'SummaryState(totalDrunk: $totalDrunk, dailyAverage: $dailyAverage, streak: $streak, unitSystem: $unitSystem, chartSelection: $chartSelection)';
}


}

/// @nodoc
abstract mixin class $SummaryStateCopyWith<$Res>  {
  factory $SummaryStateCopyWith(SummaryState value, $Res Function(SummaryState) _then) = _$SummaryStateCopyWithImpl;
@useResult
$Res call({
 Water totalDrunk, Water dailyAverage, int streak, UnitSystem unitSystem, ChartSelection chartSelection
});




}
/// @nodoc
class _$SummaryStateCopyWithImpl<$Res>
    implements $SummaryStateCopyWith<$Res> {
  _$SummaryStateCopyWithImpl(this._self, this._then);

  final SummaryState _self;
  final $Res Function(SummaryState) _then;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDrunk = null,Object? dailyAverage = null,Object? streak = null,Object? unitSystem = null,Object? chartSelection = null,}) {
  return _then(_self.copyWith(
totalDrunk: null == totalDrunk ? _self.totalDrunk : totalDrunk // ignore: cast_nullable_to_non_nullable
as Water,dailyAverage: null == dailyAverage ? _self.dailyAverage : dailyAverage // ignore: cast_nullable_to_non_nullable
as Water,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,unitSystem: null == unitSystem ? _self.unitSystem : unitSystem // ignore: cast_nullable_to_non_nullable
as UnitSystem,chartSelection: null == chartSelection ? _self.chartSelection : chartSelection // ignore: cast_nullable_to_non_nullable
as ChartSelection,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryState].
extension SummaryStatePatterns on SummaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryState value)  $default,){
final _that = this;
switch (_that) {
case _SummaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryState value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Water totalDrunk,  Water dailyAverage,  int streak,  UnitSystem unitSystem,  ChartSelection chartSelection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
return $default(_that.totalDrunk,_that.dailyAverage,_that.streak,_that.unitSystem,_that.chartSelection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Water totalDrunk,  Water dailyAverage,  int streak,  UnitSystem unitSystem,  ChartSelection chartSelection)  $default,) {final _that = this;
switch (_that) {
case _SummaryState():
return $default(_that.totalDrunk,_that.dailyAverage,_that.streak,_that.unitSystem,_that.chartSelection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Water totalDrunk,  Water dailyAverage,  int streak,  UnitSystem unitSystem,  ChartSelection chartSelection)?  $default,) {final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
return $default(_that.totalDrunk,_that.dailyAverage,_that.streak,_that.unitSystem,_that.chartSelection);case _:
  return null;

}
}

}

/// @nodoc


class _SummaryState implements SummaryState {
  const _SummaryState({this.totalDrunk = const Water.zero(), this.dailyAverage = const Water.zero(), this.streak = 0, this.unitSystem = UnitSystem.metric, this.chartSelection = ChartSelection.weekly});
  

@override@JsonKey() final  Water totalDrunk;
@override@JsonKey() final  Water dailyAverage;
@override@JsonKey() final  int streak;
@override@JsonKey() final  UnitSystem unitSystem;
@override@JsonKey() final  ChartSelection chartSelection;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryStateCopyWith<_SummaryState> get copyWith => __$SummaryStateCopyWithImpl<_SummaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryState&&(identical(other.totalDrunk, totalDrunk) || other.totalDrunk == totalDrunk)&&(identical(other.dailyAverage, dailyAverage) || other.dailyAverage == dailyAverage)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.unitSystem, unitSystem) || other.unitSystem == unitSystem)&&(identical(other.chartSelection, chartSelection) || other.chartSelection == chartSelection));
}


@override
int get hashCode => Object.hash(runtimeType,totalDrunk,dailyAverage,streak,unitSystem,chartSelection);

@override
String toString() {
  return 'SummaryState(totalDrunk: $totalDrunk, dailyAverage: $dailyAverage, streak: $streak, unitSystem: $unitSystem, chartSelection: $chartSelection)';
}


}

/// @nodoc
abstract mixin class _$SummaryStateCopyWith<$Res> implements $SummaryStateCopyWith<$Res> {
  factory _$SummaryStateCopyWith(_SummaryState value, $Res Function(_SummaryState) _then) = __$SummaryStateCopyWithImpl;
@override @useResult
$Res call({
 Water totalDrunk, Water dailyAverage, int streak, UnitSystem unitSystem, ChartSelection chartSelection
});




}
/// @nodoc
class __$SummaryStateCopyWithImpl<$Res>
    implements _$SummaryStateCopyWith<$Res> {
  __$SummaryStateCopyWithImpl(this._self, this._then);

  final _SummaryState _self;
  final $Res Function(_SummaryState) _then;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDrunk = null,Object? dailyAverage = null,Object? streak = null,Object? unitSystem = null,Object? chartSelection = null,}) {
  return _then(_SummaryState(
totalDrunk: null == totalDrunk ? _self.totalDrunk : totalDrunk // ignore: cast_nullable_to_non_nullable
as Water,dailyAverage: null == dailyAverage ? _self.dailyAverage : dailyAverage // ignore: cast_nullable_to_non_nullable
as Water,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,unitSystem: null == unitSystem ? _self.unitSystem : unitSystem // ignore: cast_nullable_to_non_nullable
as UnitSystem,chartSelection: null == chartSelection ? _self.chartSelection : chartSelection // ignore: cast_nullable_to_non_nullable
as ChartSelection,
  ));
}


}

// dart format on
