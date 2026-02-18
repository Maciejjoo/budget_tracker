// Not exactly needed but I like to have some sort of abstraction layer for repositories, even if they are not doing much at the moment. This way we can easily swap implementations in the future if needed.
import 'package:budget_tracker/src/application/local_storage/local_storage_service.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/enums/tracker_record_category.dart';
import 'package:budget_tracker/src/utils/data_state/data_state.dart';

abstract class TrackerRepository {
  Future<DataState<TrackerRecordEntity>> addExpense(
    double amount,
    String category,
    DateTime date,
  );
  Future<DataState<TrackerRecordEntity>> addIncome(
    double amount,
    String category,
    DateTime date,
  );

  Future<DataState<List<TrackerRecordEntity>>> getRecords({
    TrackerRecordCategory? category,
    int? limit,
    int? offset,
  });

  Stream<DataState<double>> watchBalance();
}

class TrackerRepositoryImpl implements TrackerRepository {
  final LocalStorageService _localStorageService;
  TrackerRepositoryImpl(this._localStorageService);

  @override
  Future<DataState<TrackerRecordEntity>> addExpense(
    double amount,
    String category,
    DateTime date,
  ) async {
    try {
      // Convert amount to cents to avoid floating point issues
      final amountInCents = (amount * 100).round();
      final record = await _localStorageService.insertRecord(
        date: date,
        amount: -amountInCents,
        category: category,
      );

      return DataState.success(
        data: TrackerRecordEntity.fromTrackerRecord(record),
      );
    } catch (_) {
      return const DataState.failure(Failure.badResponse());
    }
  }

  @override
  Future<DataState<TrackerRecordEntity>> addIncome(
    double amount,
    String category,
    DateTime date,
  ) async {
    try {
      // Convert amount to cents to avoid floating point issues
      final amountInCents = (amount * 100).round();
      final record = await _localStorageService.insertRecord(
        date: date,
        amount: amountInCents,
        category: category,
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
    TrackerRecordCategory? category,
    int? limit,
    int? offset,
  }) async {
    try {
      final records = await _localStorageService.getRecords(
        category: category?.name,
        limit: limit,
        offset: offset,
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
  Stream<DataState<double>> watchBalance() {
    return _localStorageService.watchBalance().map(
      (balanceInCents) => DataState.success(data: balanceInCents / 100),
    );
  }
}
