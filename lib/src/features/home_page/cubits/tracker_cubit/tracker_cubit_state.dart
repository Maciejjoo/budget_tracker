part of 'tracker_cubit.dart';

@freezed
sealed class TrackerCubitState with _$TrackerCubitState {
  const factory TrackerCubitState({
    @Default([]) List<TrackerRecordEntity> records,
    @Default(0) double balance,

    // Success/failure tracking
    bool? isBalanceSuccess,
    bool? isAddingRecordSuccess,

    // Loading states
    @Default(false) bool isAddingRecord,
  }) = _TrackerCubitState;
}
