// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackerCubitState {

 List<TrackerRecordEntity> get records; double get balance; bool? get isBalanceSuccess; bool? get isAddingRecordSuccess; bool get isAddingRecord;
/// Create a copy of TrackerCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerCubitStateCopyWith<TrackerCubitState> get copyWith => _$TrackerCubitStateCopyWithImpl<TrackerCubitState>(this as TrackerCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerCubitState&&const DeepCollectionEquality().equals(other.records, records)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isBalanceSuccess, isBalanceSuccess) || other.isBalanceSuccess == isBalanceSuccess)&&(identical(other.isAddingRecordSuccess, isAddingRecordSuccess) || other.isAddingRecordSuccess == isAddingRecordSuccess)&&(identical(other.isAddingRecord, isAddingRecord) || other.isAddingRecord == isAddingRecord));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(records),balance,isBalanceSuccess,isAddingRecordSuccess,isAddingRecord);

@override
String toString() {
  return 'TrackerCubitState(records: $records, balance: $balance, isBalanceSuccess: $isBalanceSuccess, isAddingRecordSuccess: $isAddingRecordSuccess, isAddingRecord: $isAddingRecord)';
}


}

/// @nodoc
abstract mixin class $TrackerCubitStateCopyWith<$Res>  {
  factory $TrackerCubitStateCopyWith(TrackerCubitState value, $Res Function(TrackerCubitState) _then) = _$TrackerCubitStateCopyWithImpl;
@useResult
$Res call({
 List<TrackerRecordEntity> records, double balance, bool? isBalanceSuccess, bool? isAddingRecordSuccess, bool isAddingRecord
});




}
/// @nodoc
class _$TrackerCubitStateCopyWithImpl<$Res>
    implements $TrackerCubitStateCopyWith<$Res> {
  _$TrackerCubitStateCopyWithImpl(this._self, this._then);

  final TrackerCubitState _self;
  final $Res Function(TrackerCubitState) _then;

/// Create a copy of TrackerCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,Object? balance = null,Object? isBalanceSuccess = freezed,Object? isAddingRecordSuccess = freezed,Object? isAddingRecord = null,}) {
  return _then(_self.copyWith(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<TrackerRecordEntity>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,isBalanceSuccess: freezed == isBalanceSuccess ? _self.isBalanceSuccess : isBalanceSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isAddingRecordSuccess: freezed == isAddingRecordSuccess ? _self.isAddingRecordSuccess : isAddingRecordSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isAddingRecord: null == isAddingRecord ? _self.isAddingRecord : isAddingRecord // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerCubitState].
extension TrackerCubitStatePatterns on TrackerCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerCubitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerCubitState value)  $default,){
final _that = this;
switch (_that) {
case _TrackerCubitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerCubitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrackerRecordEntity> records,  double balance,  bool? isBalanceSuccess,  bool? isAddingRecordSuccess,  bool isAddingRecord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerCubitState() when $default != null:
return $default(_that.records,_that.balance,_that.isBalanceSuccess,_that.isAddingRecordSuccess,_that.isAddingRecord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrackerRecordEntity> records,  double balance,  bool? isBalanceSuccess,  bool? isAddingRecordSuccess,  bool isAddingRecord)  $default,) {final _that = this;
switch (_that) {
case _TrackerCubitState():
return $default(_that.records,_that.balance,_that.isBalanceSuccess,_that.isAddingRecordSuccess,_that.isAddingRecord);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrackerRecordEntity> records,  double balance,  bool? isBalanceSuccess,  bool? isAddingRecordSuccess,  bool isAddingRecord)?  $default,) {final _that = this;
switch (_that) {
case _TrackerCubitState() when $default != null:
return $default(_that.records,_that.balance,_that.isBalanceSuccess,_that.isAddingRecordSuccess,_that.isAddingRecord);case _:
  return null;

}
}

}

/// @nodoc


class _TrackerCubitState implements TrackerCubitState {
  const _TrackerCubitState({final  List<TrackerRecordEntity> records = const [], this.balance = 0, this.isBalanceSuccess, this.isAddingRecordSuccess, this.isAddingRecord = false}): _records = records;
  

 final  List<TrackerRecordEntity> _records;
@override@JsonKey() List<TrackerRecordEntity> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

@override@JsonKey() final  double balance;
@override final  bool? isBalanceSuccess;
@override final  bool? isAddingRecordSuccess;
@override@JsonKey() final  bool isAddingRecord;

/// Create a copy of TrackerCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerCubitStateCopyWith<_TrackerCubitState> get copyWith => __$TrackerCubitStateCopyWithImpl<_TrackerCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerCubitState&&const DeepCollectionEquality().equals(other._records, _records)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isBalanceSuccess, isBalanceSuccess) || other.isBalanceSuccess == isBalanceSuccess)&&(identical(other.isAddingRecordSuccess, isAddingRecordSuccess) || other.isAddingRecordSuccess == isAddingRecordSuccess)&&(identical(other.isAddingRecord, isAddingRecord) || other.isAddingRecord == isAddingRecord));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records),balance,isBalanceSuccess,isAddingRecordSuccess,isAddingRecord);

@override
String toString() {
  return 'TrackerCubitState(records: $records, balance: $balance, isBalanceSuccess: $isBalanceSuccess, isAddingRecordSuccess: $isAddingRecordSuccess, isAddingRecord: $isAddingRecord)';
}


}

/// @nodoc
abstract mixin class _$TrackerCubitStateCopyWith<$Res> implements $TrackerCubitStateCopyWith<$Res> {
  factory _$TrackerCubitStateCopyWith(_TrackerCubitState value, $Res Function(_TrackerCubitState) _then) = __$TrackerCubitStateCopyWithImpl;
@override @useResult
$Res call({
 List<TrackerRecordEntity> records, double balance, bool? isBalanceSuccess, bool? isAddingRecordSuccess, bool isAddingRecord
});




}
/// @nodoc
class __$TrackerCubitStateCopyWithImpl<$Res>
    implements _$TrackerCubitStateCopyWith<$Res> {
  __$TrackerCubitStateCopyWithImpl(this._self, this._then);

  final _TrackerCubitState _self;
  final $Res Function(_TrackerCubitState) _then;

/// Create a copy of TrackerCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,Object? balance = null,Object? isBalanceSuccess = freezed,Object? isAddingRecordSuccess = freezed,Object? isAddingRecord = null,}) {
  return _then(_TrackerCubitState(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<TrackerRecordEntity>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,isBalanceSuccess: freezed == isBalanceSuccess ? _self.isBalanceSuccess : isBalanceSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isAddingRecordSuccess: freezed == isAddingRecordSuccess ? _self.isAddingRecordSuccess : isAddingRecordSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isAddingRecord: null == isAddingRecord ? _self.isAddingRecord : isAddingRecord // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
