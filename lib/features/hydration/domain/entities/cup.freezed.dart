// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Cup {

 int get id; CupValue get amount; DateTime get createdAt;
/// Create a copy of Cup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CupCopyWith<Cup> get copyWith => _$CupCopyWithImpl<Cup>(this as Cup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cup&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,amount,createdAt);

@override
String toString() {
  return 'Cup(id: $id, amount: $amount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CupCopyWith<$Res>  {
  factory $CupCopyWith(Cup value, $Res Function(Cup) _then) = _$CupCopyWithImpl;
@useResult
$Res call({
 int id, CupValue amount, DateTime createdAt
});




}
/// @nodoc
class _$CupCopyWithImpl<$Res>
    implements $CupCopyWith<$Res> {
  _$CupCopyWithImpl(this._self, this._then);

  final Cup _self;
  final $Res Function(Cup) _then;

/// Create a copy of Cup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as CupValue,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Cup].
extension CupPatterns on Cup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _cup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _cup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _cup value)  $default,){
final _that = this;
switch (_that) {
case _cup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _cup value)?  $default,){
final _that = this;
switch (_that) {
case _cup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CupValue amount,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _cup() when $default != null:
return $default(_that.id,_that.amount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CupValue amount,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _cup():
return $default(_that.id,_that.amount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CupValue amount,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _cup() when $default != null:
return $default(_that.id,_that.amount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _cup implements Cup {
  const _cup({this.id = 0, required this.amount, required this.createdAt});
  

@override@JsonKey() final  int id;
@override final  CupValue amount;
@override final  DateTime createdAt;

/// Create a copy of Cup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$cupCopyWith<_cup> get copyWith => __$cupCopyWithImpl<_cup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _cup&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,amount,createdAt);

@override
String toString() {
  return 'Cup(id: $id, amount: $amount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$cupCopyWith<$Res> implements $CupCopyWith<$Res> {
  factory _$cupCopyWith(_cup value, $Res Function(_cup) _then) = __$cupCopyWithImpl;
@override @useResult
$Res call({
 int id, CupValue amount, DateTime createdAt
});




}
/// @nodoc
class __$cupCopyWithImpl<$Res>
    implements _$cupCopyWith<$Res> {
  __$cupCopyWithImpl(this._self, this._then);

  final _cup _self;
  final $Res Function(_cup) _then;

/// Create a copy of Cup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? createdAt = null,}) {
  return _then(_cup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as CupValue,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
