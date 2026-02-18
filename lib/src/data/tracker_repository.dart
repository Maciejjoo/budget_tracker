// Not exactly needed but I like to have some sort of abstraction layer for repositories, even if they are not doing much at the moment. This way we can easily swap implementations in the future if needed.
import 'package:budget_tracker/src/application/local_storage/local_storage_service.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/enums/tracker_record_category.dart';
import 'package:budget_tracker/src/enums/tracker_record_type.dart';
import 'package:budget_tracker/src/utils/data_state/data_state.dart';

abstract class TrackerRepository {
  Future<DataState<TrackerRecordEntity>> addExpense({
    required double amount,
    String? category,
    String? note,
  });
  Future<DataState<TrackerRecordEntity>> addIncome({
    required double amount,
    String? note,
  });

  Future<DataState<List<TrackerRecordEntity>>> getRecords({
    TrackerRecordType? type,
    int? limit,
    int? offset,
  });

  Future<DataState<void>> deleteRecord(int id);

  Stream<DataState<double>> watchBalance();

  Future<DataState<List<(TrackerRecordCategory, int)>>>
  getCategoriesWithTotalAmount();
}

class TrackerRepositoryImpl implements TrackerRepository {
  final LocalStorageService _localStorageService;
  TrackerRepositoryImpl(this._localStorageService);

  @override
  Future<DataState<TrackerRecordEntity>> addExpense({
    required double amount,
    String? note,
    String? category,
  }) async {
    try {
      // Convert amount to cents to avoid floating point issues
      final amountInCents = (amount * 100).round();
      final record = await _localStorageService.insertRecord(
        date: DateTime.now(),
        amount: -amountInCents,
        category: category,
        description: note,
      );

      return DataState.success(
        data: TrackerRecordEntity.fromTrackerRecord(record),
      );
    } catch (_) {
      return const DataState.failure(Failure.badResponse());
    }
  }

  @override
  Future<DataState<TrackerRecordEntity>> addIncome({
    required double amount,
    String? note,
  }) async {
    try {
      // Convert amount to cents to avoid floating point issues
      final amountInCents = (amount * 100).round();
      final record = await _localStorageService.insertRecord(
        date: DateTime.now(),
        amount: amountInCents,
        category: TrackerRecordCategory.income.name,
        description: note,
      );

      return DataState.success(
        data: TrackerRecordEntity.fromTrackerRecord(record),
      );
    } catch (_) {
      return const DataState.failure(Failure.badResponse());
    }
  }

  @override
  Future<DataState<List<TrackerRecordEntity>>> getRecords({
    TrackerRecordType? type,
    int? limit,
    int? offset,
  }) async {
    try {
      final records = await _localStorageService.getRecords(
        limit: limit,
        offset: offset,
        type: type,
      );

      final entities = records
          .map(TrackerRecordEntity.fromTrackerRecord)
          .toList();

      return DataState.success(data: entities);
    } catch (_) {
      return const DataState.failure(Failure.badResponse());
    }
  }

  @override
  Future<DataState<void>> deleteRecord(int id) async {
    try {
      await _localStorageService.deleteRecord(id);
      return const DataState.success(data: null);
    } catch (_) {
      return const DataState.failure(Failure.badResponse());
    }
  }

  @override
  Future<DataState<List<(TrackerRecordCategory, int)>>>
  getCategoriesWithTotalAmount() async {
    try {
      final data = await _localStorageService.getCategoriesWithTotalAmount();
      return DataState.success(data: data);
    } catch (_) {
      return const DataState.failure(Failure.badResponse());
    }
  }

  @override
  Stream<DataState<double>> watchBalance() {
    return _localStorageService.watchBalance().map(
      (balanceInCents) => DataState.success(data: balanceInCents / 100),
    );
  }
}
