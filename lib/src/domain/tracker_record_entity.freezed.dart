// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_record_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackerRecordEntity {

 int get id; DateTime get date; double get amount; TrackerRecordType get type; TrackerRecordCategory? get category; String? get description;
/// Create a copy of TrackerRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerRecordEntityCopyWith<TrackerRecordEntity> get copyWith => _$TrackerRecordEntityCopyWithImpl<TrackerRecordEntity>(this as TrackerRecordEntity, _$identity);

  /// Serializes this TrackerRecordEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerRecordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,amount,type,category,description);

@override
String toString() {
  return 'TrackerRecordEntity(id: $id, date: $date, amount: $amount, type: $type, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class $TrackerRecordEntityCopyWith<$Res>  {
  factory $TrackerRecordEntityCopyWith(TrackerRecordEntity value, $Res Function(TrackerRecordEntity) _then) = _$TrackerRecordEntityCopyWithImpl;
@useResult
$Res call({
 int id, DateTime date, double amount, TrackerRecordType type, TrackerRecordCategory? category, String? description
});




}
/// @nodoc
class _$TrackerRecordEntityCopyWithImpl<$Res>
    implements $TrackerRecordEntityCopyWith<$Res> {
  _$TrackerRecordEntityCopyWithImpl(this._self, this._then);

  final TrackerRecordEntity _self;
  final $Res Function(TrackerRecordEntity) _then;

/// Create a copy of TrackerRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? amount = null,Object? type = null,Object? category = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TrackerRecordType,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TrackerRecordCategory?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerRecordEntity].
extension TrackerRecordEntityPatterns on TrackerRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _TrackerRecordEntity():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime date,  double amount,  TrackerRecordType type,  TrackerRecordCategory? category,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerRecordEntity() when $default != null:
return $default(_that.id,_that.date,_that.amount,_that.type,_that.category,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime date,  double amount,  TrackerRecordType type,  TrackerRecordCategory? category,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TrackerRecordEntity():
return $default(_that.id,_that.date,_that.amount,_that.type,_that.category,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime date,  double amount,  TrackerRecordType type,  TrackerRecordCategory? category,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TrackerRecordEntity() when $default != null:
return $default(_that.id,_that.date,_that.amount,_that.type,_that.category,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerRecordEntity implements TrackerRecordEntity {
  const _TrackerRecordEntity({required this.id, required this.date, required this.amount, required this.type, this.category, this.description});
  factory _TrackerRecordEntity.fromJson(Map<String, dynamic> json) => _$TrackerRecordEntityFromJson(json);

@override final  int id;
@override final  DateTime date;
@override final  double amount;
@override final  TrackerRecordType type;
@override final  TrackerRecordCategory? category;
@override final  String? description;

/// Create a copy of TrackerRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerRecordEntityCopyWith<_TrackerRecordEntity> get copyWith => __$TrackerRecordEntityCopyWithImpl<_TrackerRecordEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerRecordEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerRecordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,amount,type,category,description);

@override
String toString() {
  return 'TrackerRecordEntity(id: $id, date: $date, amount: $amount, type: $type, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TrackerRecordEntityCopyWith<$Res> implements $TrackerRecordEntityCopyWith<$Res> {
  factory _$TrackerRecordEntityCopyWith(_TrackerRecordEntity value, $Res Function(_TrackerRecordEntity) _then) = __$TrackerRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime date, double amount, TrackerRecordType type, TrackerRecordCategory? category, String? description
});




}
/// @nodoc
class __$TrackerRecordEntityCopyWithImpl<$Res>
    implements _$TrackerRecordEntityCopyWith<$Res> {
  __$TrackerRecordEntityCopyWithImpl(this._self, this._then);

  final _TrackerRecordEntity _self;
  final $Res Function(_TrackerRecordEntity) _then;

/// Create a copy of TrackerRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? amount = null,Object? type = null,Object? category = freezed,Object? description = freezed,}) {
  return _then(_TrackerRecordEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TrackerRecordType,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TrackerRecordCategory?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
