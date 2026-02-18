import 'dart:async';

import 'package:budget_tracker/src/data/tracker_repository.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/utils/cubit/safe_cubit.dart';
import 'package:budget_tracker/src/utils/data_state/data_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracker_cubit.freezed.dart';
part 'tracker_cubit_state.dart';

class TrackerCubitCubit extends SafeCubit<TrackerCubitState> {
  final TrackerRepository _trackerRepository;
  StreamSubscription<DataState<double>>? _balanceSubscription;

  TrackerCubitCubit(this._trackerRepository)
    : super(const TrackerCubitState()) {
    watchBalance();
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

  Future<void> addExpense(double amount, String category, DateTime date) async {
    // Reset the state before adding
    emit(state.copyWith(isAddingRecordSuccess: null, isAddingRecord: true));
    final result = await _trackerRepository.addExpense(amount, category, date);
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

  Future<void> addIncome(double amount, String category, DateTime date) async {
    // Reset the state before adding
    emit(state.copyWith(isAddingRecordSuccess: null, isAddingRecord: true));
    final result = await _trackerRepository.addIncome(amount, category, date);
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

  @override
  Future<void> close() {
    _balanceSubscription?.cancel();
    return super.close();
  }
}
