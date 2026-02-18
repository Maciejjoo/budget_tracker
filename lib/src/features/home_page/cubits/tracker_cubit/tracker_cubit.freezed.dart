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
mixin _$TrackerState {

// Data
 List<TrackerRecordEntity> get records; double get balance;// Success / failure tracking
 bool? get isBalanceSuccess; bool? get isAddingRecordSuccess; bool? get isRemovingRecordSuccess;// Filtering
 TrackerRecordType? get selectedType;// Loading states
 bool get isAddingRecord; bool get isLoadingRecords; bool get isLoadingChartData;// Pagination
 bool get hasMoreRecords;// Chart data
 List<(TrackerRecordCategory, int)> get categoriesWithTotalAmount;
/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerStateCopyWith<TrackerState> get copyWith => _$TrackerStateCopyWithImpl<TrackerState>(this as TrackerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerState&&const DeepCollectionEquality().equals(other.records, records)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isBalanceSuccess, isBalanceSuccess) || other.isBalanceSuccess == isBalanceSuccess)&&(identical(other.isAddingRecordSuccess, isAddingRecordSuccess) || other.isAddingRecordSuccess == isAddingRecordSuccess)&&(identical(other.isRemovingRecordSuccess, isRemovingRecordSuccess) || other.isRemovingRecordSuccess == isRemovingRecordSuccess)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.isAddingRecord, isAddingRecord) || other.isAddingRecord == isAddingRecord)&&(identical(other.isLoadingRecords, isLoadingRecords) || other.isLoadingRecords == isLoadingRecords)&&(identical(other.isLoadingChartData, isLoadingChartData) || other.isLoadingChartData == isLoadingChartData)&&(identical(other.hasMoreRecords, hasMoreRecords) || other.hasMoreRecords == hasMoreRecords)&&const DeepCollectionEquality().equals(other.categoriesWithTotalAmount, categoriesWithTotalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(records),balance,isBalanceSuccess,isAddingRecordSuccess,isRemovingRecordSuccess,selectedType,isAddingRecord,isLoadingRecords,isLoadingChartData,hasMoreRecords,const DeepCollectionEquality().hash(categoriesWithTotalAmount));

@override
String toString() {
  return 'TrackerState(records: $records, balance: $balance, isBalanceSuccess: $isBalanceSuccess, isAddingRecordSuccess: $isAddingRecordSuccess, isRemovingRecordSuccess: $isRemovingRecordSuccess, selectedType: $selectedType, isAddingRecord: $isAddingRecord, isLoadingRecords: $isLoadingRecords, isLoadingChartData: $isLoadingChartData, hasMoreRecords: $hasMoreRecords, categoriesWithTotalAmount: $categoriesWithTotalAmount)';
}


}

/// @nodoc
abstract mixin class $TrackerStateCopyWith<$Res>  {
  factory $TrackerStateCopyWith(TrackerState value, $Res Function(TrackerState) _then) = _$TrackerStateCopyWithImpl;
@useResult
$Res call({
 List<TrackerRecordEntity> records, double balance, bool? isBalanceSuccess, bool? isAddingRecordSuccess, bool? isRemovingRecordSuccess, TrackerRecordType? selectedType, bool isAddingRecord, bool isLoadingRecords, bool isLoadingChartData, bool hasMoreRecords, List<(TrackerRecordCategory, int)> categoriesWithTotalAmount
});




}
/// @nodoc
class _$TrackerStateCopyWithImpl<$Res>
    implements $TrackerStateCopyWith<$Res> {
  _$TrackerStateCopyWithImpl(this._self, this._then);

  final TrackerState _self;
  final $Res Function(TrackerState) _then;

/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,Object? balance = null,Object? isBalanceSuccess = freezed,Object? isAddingRecordSuccess = freezed,Object? isRemovingRecordSuccess = freezed,Object? selectedType = freezed,Object? isAddingRecord = null,Object? isLoadingRecords = null,Object? isLoadingChartData = null,Object? hasMoreRecords = null,Object? categoriesWithTotalAmount = null,}) {
  return _then(_self.copyWith(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<TrackerRecordEntity>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,isBalanceSuccess: freezed == isBalanceSuccess ? _self.isBalanceSuccess : isBalanceSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isAddingRecordSuccess: freezed == isAddingRecordSuccess ? _self.isAddingRecordSuccess : isAddingRecordSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isRemovingRecordSuccess: freezed == isRemovingRecordSuccess ? _self.isRemovingRecordSuccess : isRemovingRecordSuccess // ignore: cast_nullable_to_non_nullable
as bool?,selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as TrackerRecordType?,isAddingRecord: null == isAddingRecord ? _self.isAddingRecord : isAddingRecord // ignore: cast_nullable_to_non_nullable
as bool,isLoadingRecords: null == isLoadingRecords ? _self.isLoadingRecords : isLoadingRecords // ignore: cast_nullable_to_non_nullable
as bool,isLoadingChartData: null == isLoadingChartData ? _self.isLoadingChartData : isLoadingChartData // ignore: cast_nullable_to_non_nullable
as bool,hasMoreRecords: null == hasMoreRecords ? _self.hasMoreRecords : hasMoreRecords // ignore: cast_nullable_to_non_nullable
as bool,categoriesWithTotalAmount: null == categoriesWithTotalAmount ? _self.categoriesWithTotalAmount : categoriesWithTotalAmount // ignore: cast_nullable_to_non_nullable
as List<(TrackerRecordCategory, int)>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerState].
extension TrackerStatePatterns on TrackerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerState value)  $default,){
final _that = this;
switch (_that) {
case _TrackerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrackerRecordEntity> records,  double balance,  bool? isBalanceSuccess,  bool? isAddingRecordSuccess,  bool? isRemovingRecordSuccess,  TrackerRecordType? selectedType,  bool isAddingRecord,  bool isLoadingRecords,  bool isLoadingChartData,  bool hasMoreRecords,  List<(TrackerRecordCategory, int)> categoriesWithTotalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
return $default(_that.records,_that.balance,_that.isBalanceSuccess,_that.isAddingRecordSuccess,_that.isRemovingRecordSuccess,_that.selectedType,_that.isAddingRecord,_that.isLoadingRecords,_that.isLoadingChartData,_that.hasMoreRecords,_that.categoriesWithTotalAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrackerRecordEntity> records,  double balance,  bool? isBalanceSuccess,  bool? isAddingRecordSuccess,  bool? isRemovingRecordSuccess,  TrackerRecordType? selectedType,  bool isAddingRecord,  bool isLoadingRecords,  bool isLoadingChartData,  bool hasMoreRecords,  List<(TrackerRecordCategory, int)> categoriesWithTotalAmount)  $default,) {final _that = this;
switch (_that) {
case _TrackerState():
return $default(_that.records,_that.balance,_that.isBalanceSuccess,_that.isAddingRecordSuccess,_that.isRemovingRecordSuccess,_that.selectedType,_that.isAddingRecord,_that.isLoadingRecords,_that.isLoadingChartData,_that.hasMoreRecords,_that.categoriesWithTotalAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrackerRecordEntity> records,  double balance,  bool? isBalanceSuccess,  bool? isAddingRecordSuccess,  bool? isRemovingRecordSuccess,  TrackerRecordType? selectedType,  bool isAddingRecord,  bool isLoadingRecords,  bool isLoadingChartData,  bool hasMoreRecords,  List<(TrackerRecordCategory, int)> categoriesWithTotalAmount)?  $default,) {final _that = this;
switch (_that) {
case _TrackerState() when $default != null:
return $default(_that.records,_that.balance,_that.isBalanceSuccess,_that.isAddingRecordSuccess,_that.isRemovingRecordSuccess,_that.selectedType,_that.isAddingRecord,_that.isLoadingRecords,_that.isLoadingChartData,_that.hasMoreRecords,_that.categoriesWithTotalAmount);case _:
  return null;

}
}

}

/// @nodoc


class _TrackerState implements TrackerState {
  const _TrackerState({final  List<TrackerRecordEntity> records = const [], this.balance = 0, this.isBalanceSuccess, this.isAddingRecordSuccess, this.isRemovingRecordSuccess, this.selectedType, this.isAddingRecord = false, this.isLoadingRecords = false, this.isLoadingChartData = false, this.hasMoreRecords = false, final  List<(TrackerRecordCategory, int)> categoriesWithTotalAmount = const []}): _records = records,_categoriesWithTotalAmount = categoriesWithTotalAmount;
  

// Data
 final  List<TrackerRecordEntity> _records;
// Data
@override@JsonKey() List<TrackerRecordEntity> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

@override@JsonKey() final  double balance;
// Success / failure tracking
@override final  bool? isBalanceSuccess;
@override final  bool? isAddingRecordSuccess;
@override final  bool? isRemovingRecordSuccess;
// Filtering
@override final  TrackerRecordType? selectedType;
// Loading states
@override@JsonKey() final  bool isAddingRecord;
@override@JsonKey() final  bool isLoadingRecords;
@override@JsonKey() final  bool isLoadingChartData;
// Pagination
@override@JsonKey() final  bool hasMoreRecords;
// Chart data
 final  List<(TrackerRecordCategory, int)> _categoriesWithTotalAmount;
// Chart data
@override@JsonKey() List<(TrackerRecordCategory, int)> get categoriesWithTotalAmount {
  if (_categoriesWithTotalAmount is EqualUnmodifiableListView) return _categoriesWithTotalAmount;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoriesWithTotalAmount);
}


/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerStateCopyWith<_TrackerState> get copyWith => __$TrackerStateCopyWithImpl<_TrackerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerState&&const DeepCollectionEquality().equals(other._records, _records)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isBalanceSuccess, isBalanceSuccess) || other.isBalanceSuccess == isBalanceSuccess)&&(identical(other.isAddingRecordSuccess, isAddingRecordSuccess) || other.isAddingRecordSuccess == isAddingRecordSuccess)&&(identical(other.isRemovingRecordSuccess, isRemovingRecordSuccess) || other.isRemovingRecordSuccess == isRemovingRecordSuccess)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.isAddingRecord, isAddingRecord) || other.isAddingRecord == isAddingRecord)&&(identical(other.isLoadingRecords, isLoadingRecords) || other.isLoadingRecords == isLoadingRecords)&&(identical(other.isLoadingChartData, isLoadingChartData) || other.isLoadingChartData == isLoadingChartData)&&(identical(other.hasMoreRecords, hasMoreRecords) || other.hasMoreRecords == hasMoreRecords)&&const DeepCollectionEquality().equals(other._categoriesWithTotalAmount, _categoriesWithTotalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records),balance,isBalanceSuccess,isAddingRecordSuccess,isRemovingRecordSuccess,selectedType,isAddingRecord,isLoadingRecords,isLoadingChartData,hasMoreRecords,const DeepCollectionEquality().hash(_categoriesWithTotalAmount));

@override
String toString() {
  return 'TrackerState(records: $records, balance: $balance, isBalanceSuccess: $isBalanceSuccess, isAddingRecordSuccess: $isAddingRecordSuccess, isRemovingRecordSuccess: $isRemovingRecordSuccess, selectedType: $selectedType, isAddingRecord: $isAddingRecord, isLoadingRecords: $isLoadingRecords, isLoadingChartData: $isLoadingChartData, hasMoreRecords: $hasMoreRecords, categoriesWithTotalAmount: $categoriesWithTotalAmount)';
}


}

/// @nodoc
abstract mixin class _$TrackerStateCopyWith<$Res> implements $TrackerStateCopyWith<$Res> {
  factory _$TrackerStateCopyWith(_TrackerState value, $Res Function(_TrackerState) _then) = __$TrackerStateCopyWithImpl;
@override @useResult
$Res call({
 List<TrackerRecordEntity> records, double balance, bool? isBalanceSuccess, bool? isAddingRecordSuccess, bool? isRemovingRecordSuccess, TrackerRecordType? selectedType, bool isAddingRecord, bool isLoadingRecords, bool isLoadingChartData, bool hasMoreRecords, List<(TrackerRecordCategory, int)> categoriesWithTotalAmount
});




}
/// @nodoc
class __$TrackerStateCopyWithImpl<$Res>
    implements _$TrackerStateCopyWith<$Res> {
  __$TrackerStateCopyWithImpl(this._self, this._then);

  final _TrackerState _self;
  final $Res Function(_TrackerState) _then;

/// Create a copy of TrackerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,Object? balance = null,Object? isBalanceSuccess = freezed,Object? isAddingRecordSuccess = freezed,Object? isRemovingRecordSuccess = freezed,Object? selectedType = freezed,Object? isAddingRecord = null,Object? isLoadingRecords = null,Object? isLoadingChartData = null,Object? hasMoreRecords = null,Object? categoriesWithTotalAmount = null,}) {
  return _then(_TrackerState(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<TrackerRecordEntity>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,isBalanceSuccess: freezed == isBalanceSuccess ? _self.isBalanceSuccess : isBalanceSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isAddingRecordSuccess: freezed == isAddingRecordSuccess ? _self.isAddingRecordSuccess : isAddingRecordSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isRemovingRecordSuccess: freezed == isRemovingRecordSuccess ? _self.isRemovingRecordSuccess : isRemovingRecordSuccess // ignore: cast_nullable_to_non_nullable
as bool?,selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as TrackerRecordType?,isAddingRecord: null == isAddingRecord ? _self.isAddingRecord : isAddingRecord // ignore: cast_nullable_to_non_nullable
as bool,isLoadingRecords: null == isLoadingRecords ? _self.isLoadingRecords : isLoadingRecords // ignore: cast_nullable_to_non_nullable
as bool,isLoadingChartData: null == isLoadingChartData ? _self.isLoadingChartData : isLoadingChartData // ignore: cast_nullable_to_non_nullable
as bool,hasMoreRecords: null == hasMoreRecords ? _self.hasMoreRecords : hasMoreRecords // ignore: cast_nullable_to_non_nullable
as bool,categoriesWithTotalAmount: null == categoriesWithTotalAmount ? _self._categoriesWithTotalAmount : categoriesWithTotalAmount // ignore: cast_nullable_to_non_nullable
as List<(TrackerRecordCategory, int)>,
  ));
}


}

// dart format on
