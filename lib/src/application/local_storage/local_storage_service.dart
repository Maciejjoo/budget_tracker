import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'local_storage_service.g.dart';

class TrackerRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();

  // Amount in cents to avoid floating point issues, e.g. 1000 represents $10.00
  // + income, - expense
  IntColumn get amount => integer()();
  TextColumn get category => text().nullable()();
  TextColumn get description => text().nullable()();
}

@DriftDatabase(tables: [TrackerRecords])
class LocalStorage extends _$LocalStorage {
  LocalStorage() : super(_openConnection());

  LocalStorage.forTesting(super.e);

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'local_storage');
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // Migration would go there
      }
    },
  );
}

class LocalStorageService {
  final LocalStorage _localStorage;

  LocalStorageService(this._localStorage);

  Stream<int> watchBalance() {
    return _localStorage
        .select(_localStorage.trackerRecords)
        .watch()
        .map(
          (records) => records.fold(0, (sum, record) => sum + record.amount),
        );
  }

  Future<TrackerRecord> insertRecord({
    required DateTime date,
    required int amount,
    String? category,
    String? description,
  }) async {
    await _localStorage
        .into(_localStorage.trackerRecords)
        .insert(
          TrackerRecordsCompanion.insert(
            date: date,
            amount: amount,
            category: Value(category),
            description: Value(description),
          ),
        );

    // Get the last inserted record to return it
    final query = _localStorage.select(_localStorage.trackerRecords);
    query.orderBy([
      (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc),
    ]);
    query.limit(1);
    return await query.getSingle();
  }

  Future<List<TrackerRecord>> getRecords({
    String? category,
    int? limit,
    int? offset,
  }) async {
    final query = _localStorage.select(_localStorage.trackerRecords);
    if (category != null) {
      query.where((tbl) => tbl.category.equals(category));
    }
    if (limit != null || offset != null) {
      query.limit(limit ?? -1, offset: offset);
    }
    query.orderBy([
      (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc),
    ]);
    final records = await query.get();
    return records
        .map(
          (record) => TrackerRecord(
            id: record.id,
            date: record.date,
            amount: record.amount,
            category: record.category,
            description: record.description,
          ),
        )
        .toList();
  }
}
