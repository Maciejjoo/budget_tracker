part of 'tracker_cubit.dart';

@freezed
sealed class TrackerState with _$TrackerState {
  const factory TrackerState({
    // Data
    @Default([]) List<TrackerRecordEntity> records,
    @Default(0) double balance,

    // Success / failure tracking
    bool? isBalanceSuccess,
    bool? isAddingRecordSuccess,
    bool? isRemovingRecordSuccess,

    // Filtering
    TrackerRecordType? selectedType,

    // Loading states
    @Default(false) bool isAddingRecord,
    @Default(false) bool isLoadingRecords,
    @Default(false) bool isLoadingChartData,

    // Pagination
    @Default(false) bool hasMoreRecords,

    // Chart data
    @Default([]) List<(TrackerRecordCategory, int)> categoriesWithTotalAmount,
  }) = _TrackerState;
}
