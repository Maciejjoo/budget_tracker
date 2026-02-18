import 'dart:async';

import 'package:budget_tracker/src/data/tracker_repository.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/enums/tracker_record_category.dart';
import 'package:budget_tracker/src/enums/tracker_record_type.dart';
import 'package:budget_tracker/src/utils/cubit/safe_cubit.dart';
import 'package:budget_tracker/src/utils/data_state/data_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracker_cubit.freezed.dart';
part 'tracker_state.dart';

class TrackerCubit extends SafeCubit<TrackerState> {
  final TrackerRepository _trackerRepository;
  StreamSubscription<DataState<double>>? _balanceSubscription;
  static const int _pageSize = 20;
  static const int _limitAmount = 1000000;

  TrackerCubit(this._trackerRepository) : super(const TrackerState()) {
    watchBalance();
    loadRecords();
  }

  void selectFilterType(TrackerRecordType? type) {
    emit(state.copyWith(selectedType: type));
    loadRecords();
  }

  void watchBalance() {
    _balanceSubscription?.cancel();
    _balanceSubscription = _trackerRepository.watchBalance().listen((balance) {
      balance.handle(
        success: (data) {
          // Let's not handle this success in any special way, just update the balance
          emit(state.copyWith(balance: data, isBalanceSuccess: null));
        },
        failure: (failure) {
          emit(state.copyWith(isBalanceSuccess: false));
        },
      );
    });
  }

  Future<void> deleteRecord(int recordId) async {
    emit(state.copyWith(isRemovingRecordSuccess: null));
    // Optimistically update the UI
    final currentRecords = List<TrackerRecordEntity>.from(state.records);
    final recordIndex = currentRecords.indexWhere((r) => r.id == recordId);
    if (recordIndex == -1) return; // Record not found, do nothing

    final removedRecord = currentRecords.removeAt(recordIndex);
    emit(state.copyWith(records: currentRecords));

    final result = await _trackerRepository.deleteRecord(recordId);
    result.handle(
      success: (_) {
        emit(state.copyWith(isRemovingRecordSuccess: true));
      },
      failure: (failure) {
        // Revert the optimistic update
        currentRecords.insert(recordIndex, removedRecord);
        emit(
          state.copyWith(
            records: currentRecords,
            isRemovingRecordSuccess: false,
          ),
        );
      },
    );
  }

  Future<void> addExpense({
    required double amount,
    required String category,
    String? note,
  }) async {
    // Reset the state before adding
    emit(state.copyWith(isAddingRecordSuccess: null, isAddingRecord: true));
    if (amount > _limitAmount) {
      emit(state.copyWith(isAddingRecordSuccess: false, isAddingRecord: false));
      return;
    }
    final result = await _trackerRepository.addExpense(
      amount: amount,
      category: category,
      note: note,
    );
    result.handle(
      success: (record) {
        final currentRecords = List<TrackerRecordEntity>.from(state.records);
        // Add new record at the beginning
        currentRecords.insert(0, record);
        emit(
          state.copyWith(
            records: currentRecords,
            isAddingRecordSuccess: true,
            isAddingRecord: false,
          ),
        );
      },
      failure: (failure) {
        // Display error
        emit(
          state.copyWith(isAddingRecordSuccess: false, isAddingRecord: false),
        );
      },
    );
  }

  Future<void> addIncome({required double amount, String? note}) async {
    // Reset the state before adding
    emit(state.copyWith(isAddingRecordSuccess: null, isAddingRecord: true));
    if (amount > _limitAmount) {
      emit(state.copyWith(isAddingRecordSuccess: false, isAddingRecord: false));
      return;
    }
    final result = await _trackerRepository.addIncome(
      amount: amount,
      note: note,
    );
    result.handle(
      success: (record) {
        final currentRecords = List<TrackerRecordEntity>.from(state.records);
        // Add new record at the beginning
        currentRecords.insert(0, record);

        emit(
          state.copyWith(
            records: currentRecords,
            isAddingRecordSuccess: true,
            isAddingRecord: false,
          ),
        );
      },
      failure: (failure) {
        // Display error
        emit(
          state.copyWith(isAddingRecordSuccess: false, isAddingRecord: false),
        );
      },
    );
  }

  Future<void> loadRecords({bool loadMore = false}) async {
    if (state.isLoadingRecords) return;

    emit(state.copyWith(isLoadingRecords: true));

    final offset = loadMore ? state.records.length : 0;
    final result = await _trackerRepository.getRecords(
      limit: _pageSize,
      offset: offset,
      type: state.selectedType,
    );
    result.handle(
      success: (newRecords) {
        final updatedRecords = loadMore
            ? [...state.records, ...newRecords]
            : newRecords;

        emit(
          state.copyWith(
            records: updatedRecords,
            isLoadingRecords: false,
            hasMoreRecords: newRecords.length == _pageSize,
          ),
        );
      },
      failure: (failure) {
        emit(state.copyWith(isLoadingRecords: false));
      },
    );
  }

  Future<void> getChartData() async {
    if (state.isLoadingChartData) return;

    emit(state.copyWith(isLoadingChartData: true));

    final result = await _trackerRepository.getCategoriesWithTotalAmount();
    result.handle(
      success: (data) {
        emit(
          state.copyWith(
            categoriesWithTotalAmount: data,
            isLoadingChartData: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isLoadingChartData: false,
            categoriesWithTotalAmount: [],
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _balanceSubscription?.cancel();
    return super.close();
  }
}
