part of 'tracker_cubit.dart';

@freezed
sealed class TrackerState with _$TrackerState {
  const factory TrackerState({
    @Default([]) List<TrackerRecordEntity> records,
    @Default(0) double balance,

    // Success/failure tracking
    bool? isBalanceSuccess,
    bool? isAddingRecordSuccess,

    // Loading states
    @Default(false) bool isAddingRecord,
    @Default(false) bool isLoadingRecords,
    @Default(false) bool hasMoreRecords,
  }) = _TrackerState;
}
