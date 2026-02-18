// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DayTableTable extends DayTable
    with TableInfo<$DayTableTable, DayTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dailyGoalMeta = const VerificationMeta(
    'dailyGoal',
  );
  @override
  late final GeneratedColumn<int> dailyGoal = GeneratedColumn<int>(
    'daily_goal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentAmountMeta = const VerificationMeta(
    'currentAmount',
  );
  @override
  late final GeneratedColumn<int> currentAmount = GeneratedColumn<int>(
    'current_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyGoal,
    currentAmount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_goal')) {
      context.handle(
        _dailyGoalMeta,
        dailyGoal.isAcceptableOrUnknown(data['daily_goal']!, _dailyGoalMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyGoalMeta);
    }
    if (data.containsKey('current_amount')) {
      context.handle(
        _currentAmountMeta,
        currentAmount.isAcceptableOrUnknown(
          data['current_amount']!,
          _currentAmountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dailyGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_goal'],
      )!,
      currentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DayTableTable createAlias(String alias) {
    return $DayTableTable(attachedDatabase, alias);
  }
}

class DayTableData extends DataClass implements Insertable<DayTableData> {
  final int id;
  final int dailyGoal;
  final int currentAmount;
  final DateTime createdAt;
  const DayTableData({
    required this.id,
    required this.dailyGoal,
    required this.currentAmount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_goal'] = Variable<int>(dailyGoal);
    map['current_amount'] = Variable<int>(currentAmount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DayTableCompanion toCompanion(bool nullToAbsent) {
    return DayTableCompanion(
      id: Value(id),
      dailyGoal: Value(dailyGoal),
      currentAmount: Value(currentAmount),
      createdAt: Value(createdAt),
    );
  }

  factory DayTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayTableData(
      id: serializer.fromJson<int>(json['id']),
      dailyGoal: serializer.fromJson<int>(json['dailyGoal']),
      currentAmount: serializer.fromJson<int>(json['currentAmount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyGoal': serializer.toJson<int>(dailyGoal),
      'currentAmount': serializer.toJson<int>(currentAmount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DayTableData copyWith({
    int? id,
    int? dailyGoal,
    int? currentAmount,
    DateTime? createdAt,
  }) => DayTableData(
    id: id ?? this.id,
    dailyGoal: dailyGoal ?? this.dailyGoal,
    currentAmount: currentAmount ?? this.currentAmount,
    createdAt: createdAt ?? this.createdAt,
  );
  DayTableData copyWithCompanion(DayTableCompanion data) {
    return DayTableData(
      id: data.id.present ? data.id.value : this.id,
      dailyGoal: data.dailyGoal.present ? data.dailyGoal.value : this.dailyGoal,
      currentAmount: data.currentAmount.present
          ? data.currentAmount.value
          : this.currentAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayTableData(')
          ..write('id: $id, ')
          ..write('dailyGoal: $dailyGoal, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dailyGoal, currentAmount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayTableData &&
          other.id == this.id &&
          other.dailyGoal == this.dailyGoal &&
          other.currentAmount == this.currentAmount &&
          other.createdAt == this.createdAt);
}

class DayTableCompanion extends UpdateCompanion<DayTableData> {
  final Value<int> id;
  final Value<int> dailyGoal;
  final Value<int> currentAmount;
  final Value<DateTime> createdAt;
  const DayTableCompanion({
    this.id = const Value.absent(),
    this.dailyGoal = const Value.absent(),
    this.currentAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DayTableCompanion.insert({
    this.id = const Value.absent(),
    required int dailyGoal,
    this.currentAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : dailyGoal = Value(dailyGoal);
  static Insertable<DayTableData> custom({
    Expression<int>? id,
    Expression<int>? dailyGoal,
    Expression<int>? currentAmount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyGoal != null) 'daily_goal': dailyGoal,
      if (currentAmount != null) 'current_amount': currentAmount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DayTableCompanion copyWith({
    Value<int>? id,
    Value<int>? dailyGoal,
    Value<int>? currentAmount,
    Value<DateTime>? createdAt,
  }) {
    return DayTableCompanion(
      id: id ?? this.id,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      currentAmount: currentAmount ?? this.currentAmount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyGoal.present) {
      map['daily_goal'] = Variable<int>(dailyGoal.value);
    }
    if (currentAmount.present) {
      map['current_amount'] = Variable<int>(currentAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayTableCompanion(')
          ..write('id: $id, ')
          ..write('dailyGoal: $dailyGoal, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DayTableTable dayTable = $DayTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dayTable];
}

typedef $$DayTableTableCreateCompanionBuilder =
    DayTableCompanion Function({
      Value<int> id,
      required int dailyGoal,
      Value<int> currentAmount,
      Value<DateTime> createdAt,
    });
typedef $$DayTableTableUpdateCompanionBuilder =
    DayTableCompanion Function({
      Value<int> id,
      Value<int> dailyGoal,
      Value<int> currentAmount,
      Value<DateTime> createdAt,
    });

class $$DayTableTableFilterComposer
    extends Composer<_$AppDatabase, $DayTableTable> {
  $$DayTableTableFilterComposer({
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

  ColumnFilters<int> get dailyGoal => $composableBuilder(
    column: $table.dailyGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentAmount => $composableBuilder(
    column: $table.currentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DayTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DayTableTable> {
  $$DayTableTableOrderingComposer({
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

  ColumnOrderings<int> get dailyGoal => $composableBuilder(
    column: $table.dailyGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentAmount => $composableBuilder(
    column: $table.currentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DayTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayTableTable> {
  $$DayTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyGoal =>
      $composableBuilder(column: $table.dailyGoal, builder: (column) => column);

  GeneratedColumn<int> get currentAmount => $composableBuilder(
    column: $table.currentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DayTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayTableTable,
          DayTableData,
          $$DayTableTableFilterComposer,
          $$DayTableTableOrderingComposer,
          $$DayTableTableAnnotationComposer,
          $$DayTableTableCreateCompanionBuilder,
          $$DayTableTableUpdateCompanionBuilder,
          (
            DayTableData,
            BaseReferences<_$AppDatabase, $DayTableTable, DayTableData>,
          ),
          DayTableData,
          PrefetchHooks Function()
        > {
  $$DayTableTableTableManager(_$AppDatabase db, $DayTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dailyGoal = const Value.absent(),
                Value<int> currentAmount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DayTableCompanion(
                id: id,
                dailyGoal: dailyGoal,
                currentAmount: currentAmount,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyGoal,
                Value<int> currentAmount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DayTableCompanion.insert(
                id: id,
                dailyGoal: dailyGoal,
                currentAmount: currentAmount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DayTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayTableTable,
      DayTableData,
      $$DayTableTableFilterComposer,
      $$DayTableTableOrderingComposer,
      $$DayTableTableAnnotationComposer,
      $$DayTableTableCreateCompanionBuilder,
      $$DayTableTableUpdateCompanionBuilder,
      (
        DayTableData,
        BaseReferences<_$AppDatabase, $DayTableTable, DayTableData>,
      ),
      DayTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DayTableTableTableManager get dayTable =>
      $$DayTableTableTableManager(_db, _db.dayTable);
}
