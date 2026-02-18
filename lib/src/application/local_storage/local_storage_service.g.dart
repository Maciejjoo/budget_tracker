// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_service.dart';

// ignore_for_file: type=lint
class $TrackerRecordsTable extends TrackerRecords
    with TableInfo<$TrackerRecordsTable, TrackerRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackerRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    amount,
    category,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracker_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrackerRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackerRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackerRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $TrackerRecordsTable createAlias(String alias) {
    return $TrackerRecordsTable(attachedDatabase, alias);
  }
}

class TrackerRecord extends DataClass implements Insertable<TrackerRecord> {
  final int id;
  final DateTime date;
  final int amount;
  final String? category;
  final String? description;
  const TrackerRecord({
    required this.id,
    required this.date,
    required this.amount,
    this.category,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TrackerRecordsCompanion toCompanion(bool nullToAbsent) {
    return TrackerRecordsCompanion(
      id: Value(id),
      date: Value(date),
      amount: Value(amount),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TrackerRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackerRecord(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<int>(json['amount']),
      category: serializer.fromJson<String?>(json['category']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<int>(amount),
      'category': serializer.toJson<String?>(category),
      'description': serializer.toJson<String?>(description),
    };
  }

  TrackerRecord copyWith({
    int? id,
    DateTime? date,
    int? amount,
    Value<String?> category = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => TrackerRecord(
    id: id ?? this.id,
    date: date ?? this.date,
    amount: amount ?? this.amount,
    category: category.present ? category.value : this.category,
    description: description.present ? description.value : this.description,
  );
  TrackerRecord copyWithCompanion(TrackerRecordsCompanion data) {
    return TrackerRecord(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackerRecord(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, amount, category, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackerRecord &&
          other.id == this.id &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.category == this.category &&
          other.description == this.description);
}

class TrackerRecordsCompanion extends UpdateCompanion<TrackerRecord> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> amount;
  final Value<String?> category;
  final Value<String?> description;
  const TrackerRecordsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
  });
  TrackerRecordsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int amount,
    this.category = const Value.absent(),
    this.description = const Value.absent(),
  }) : date = Value(date),
       amount = Value(amount);
  static Insertable<TrackerRecord> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? amount,
    Expression<String>? category,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
    });
  }

  TrackerRecordsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? amount,
    Value<String?>? category,
    Value<String?>? description,
  }) {
    return TrackerRecordsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackerRecordsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalStorage extends GeneratedDatabase {
  _$LocalStorage(QueryExecutor e) : super(e);
  $LocalStorageManager get managers => $LocalStorageManager(this);
  late final $TrackerRecordsTable trackerRecords = $TrackerRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [trackerRecords];
}

typedef $$TrackerRecordsTableCreateCompanionBuilder =
    TrackerRecordsCompanion Function({
      Value<int> id,
      required DateTime date,
      required int amount,
      Value<String?> category,
      Value<String?> description,
    });
typedef $$TrackerRecordsTableUpdateCompanionBuilder =
    TrackerRecordsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> amount,
      Value<String?> category,
      Value<String?> description,
    });

class $$TrackerRecordsTableFilterComposer
    extends Composer<_$LocalStorage, $TrackerRecordsTable> {
  $$TrackerRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrackerRecordsTableOrderingComposer
    extends Composer<_$LocalStorage, $TrackerRecordsTable> {
  $$TrackerRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrackerRecordsTableAnnotationComposer
    extends Composer<_$LocalStorage, $TrackerRecordsTable> {
  $$TrackerRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$TrackerRecordsTableTableManager
    extends
        RootTableManager<
          _$LocalStorage,
          $TrackerRecordsTable,
          TrackerRecord,
          $$TrackerRecordsTableFilterComposer,
          $$TrackerRecordsTableOrderingComposer,
          $$TrackerRecordsTableAnnotationComposer,
          $$TrackerRecordsTableCreateCompanionBuilder,
          $$TrackerRecordsTableUpdateCompanionBuilder,
          (
            TrackerRecord,
            BaseReferences<_$LocalStorage, $TrackerRecordsTable, TrackerRecord>,
          ),
          TrackerRecord,
          PrefetchHooks Function()
        > {
  $$TrackerRecordsTableTableManager(
    _$LocalStorage db,
    $TrackerRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackerRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrackerRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrackerRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => TrackerRecordsCompanion(
                id: id,
                date: date,
                amount: amount,
                category: category,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required int amount,
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => TrackerRecordsCompanion.insert(
                id: id,
                date: date,
                amount: amount,
                category: category,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrackerRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStorage,
      $TrackerRecordsTable,
      TrackerRecord,
      $$TrackerRecordsTableFilterComposer,
      $$TrackerRecordsTableOrderingComposer,
      $$TrackerRecordsTableAnnotationComposer,
      $$TrackerRecordsTableCreateCompanionBuilder,
      $$TrackerRecordsTableUpdateCompanionBuilder,
      (
        TrackerRecord,
        BaseReferences<_$LocalStorage, $TrackerRecordsTable, TrackerRecord>,
      ),
      TrackerRecord,
      PrefetchHooks Function()
    >;

class $LocalStorageManager {
  final _$LocalStorage _db;
  $LocalStorageManager(this._db);
  $$TrackerRecordsTableTableManager get trackerRecords =>
      $$TrackerRecordsTableTableManager(_db, _db.trackerRecords);
}
