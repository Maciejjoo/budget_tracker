import 'dart:async';

import 'package:budget_tracker/src/data/tracker_repository.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/utils/cubit/safe_cubit.dart';
import 'package:budget_tracker/src/utils/data_state/data_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracker_cubit.freezed.dart';
part 'tracker_state.dart';

class TrackerCubit extends SafeCubit<TrackerState> {
  final TrackerRepository _trackerRepository;
  StreamSubscription<DataState<double>>? _balanceSubscription;
  static const int _pageSize = 20;

  TrackerCubit(this._trackerRepository) : super(const TrackerState()) {
    watchBalance();
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

  Future<void> addExpense({
    required double amount,
    required String category,
  }) async {
    // Reset the state before adding
    emit(state.copyWith(isAddingRecordSuccess: null, isAddingRecord: true));
    final result = await _trackerRepository.addExpense(
      amount: amount,
      category: category,
    );
    result.handle(
      success: (record) {
        final currentRecords = List<TrackerRecordEntity>.from(state.records);
        currentRecords.insert(0, record); // Add new record at the beginning
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

  Future<void> addIncome({required double amount}) async {
    // Reset the state before adding
    emit(state.copyWith(isAddingRecordSuccess: null, isAddingRecord: true));
    final result = await _trackerRepository.addIncome(amount: amount);
    print('addIncome result: $result');
    result.handle(
      success: (record) {
        final currentRecords = List<TrackerRecordEntity>.from(state.records);
        currentRecords.insert(0, record); // Add new record at the beginning

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

  @override
  Future<void> close() {
    _balanceSubscription?.cancel();
    return super.close();
  }
}
