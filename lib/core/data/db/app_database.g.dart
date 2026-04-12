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
    requiredDuringInsert: true,
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
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
    required DateTime createdAt,
  }) : dailyGoal = Value(dailyGoal),
       createdAt = Value(createdAt);
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

class $CupsTableTable extends CupsTable
    with TableInfo<$CupsTableTable, CupsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CupsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, amount, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cups_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CupsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
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
  CupsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CupsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CupsTableTable createAlias(String alias) {
    return $CupsTableTable(attachedDatabase, alias);
  }
}

class CupsTableData extends DataClass implements Insertable<CupsTableData> {
  final int id;
  final int amount;
  final DateTime createdAt;
  const CupsTableData({
    required this.id,
    required this.amount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CupsTableCompanion toCompanion(bool nullToAbsent) {
    return CupsTableCompanion(
      id: Value(id),
      amount: Value(amount),
      createdAt: Value(createdAt),
    );
  }

  factory CupsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CupsTableData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CupsTableData copyWith({int? id, int? amount, DateTime? createdAt}) =>
      CupsTableData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
      );
  CupsTableData copyWithCompanion(CupsTableCompanion data) {
    return CupsTableData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CupsTableData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CupsTableData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt);
}

class CupsTableCompanion extends UpdateCompanion<CupsTableData> {
  final Value<int> id;
  final Value<int> amount;
  final Value<DateTime> createdAt;
  const CupsTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CupsTableCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    this.createdAt = const Value.absent(),
  }) : amount = Value(amount);
  static Insertable<CupsTableData> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CupsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? amount,
    Value<DateTime>? createdAt,
  }) {
    return CupsTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CupsTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HistoryItemsTableTable extends HistoryItemsTable
    with TableInfo<$HistoryItemsTableTable, HistoryItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryItemsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_table (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
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
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, day, amount, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
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
  HistoryItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $HistoryItemsTableTable createAlias(String alias) {
    return $HistoryItemsTableTable(attachedDatabase, alias);
  }
}

class HistoryItemsTableData extends DataClass
    implements Insertable<HistoryItemsTableData> {
  final int id;
  final int day;
  final int amount;
  final DateTime createdAt;
  const HistoryItemsTableData({
    required this.id,
    required this.day,
    required this.amount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day'] = Variable<int>(day);
    map['amount'] = Variable<int>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HistoryItemsTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryItemsTableCompanion(
      id: Value(id),
      day: Value(day),
      amount: Value(amount),
      createdAt: Value(createdAt),
    );
  }

  factory HistoryItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryItemsTableData(
      id: serializer.fromJson<int>(json['id']),
      day: serializer.fromJson<int>(json['day']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'day': serializer.toJson<int>(day),
      'amount': serializer.toJson<int>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HistoryItemsTableData copyWith({
    int? id,
    int? day,
    int? amount,
    DateTime? createdAt,
  }) => HistoryItemsTableData(
    id: id ?? this.id,
    day: day ?? this.day,
    amount: amount ?? this.amount,
    createdAt: createdAt ?? this.createdAt,
  );
  HistoryItemsTableData copyWithCompanion(HistoryItemsTableCompanion data) {
    return HistoryItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      day: data.day.present ? data.day.value : this.day,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryItemsTableData(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, day, amount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryItemsTableData &&
          other.id == this.id &&
          other.day == this.day &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt);
}

class HistoryItemsTableCompanion
    extends UpdateCompanion<HistoryItemsTableData> {
  final Value<int> id;
  final Value<int> day;
  final Value<int> amount;
  final Value<DateTime> createdAt;
  const HistoryItemsTableCompanion({
    this.id = const Value.absent(),
    this.day = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HistoryItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int day,
    required int amount,
    this.createdAt = const Value.absent(),
  }) : day = Value(day),
       amount = Value(amount);
  static Insertable<HistoryItemsTableData> custom({
    Expression<int>? id,
    Expression<int>? day,
    Expression<int>? amount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (day != null) 'day': day,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HistoryItemsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? day,
    Value<int>? amount,
    Value<DateTime>? createdAt,
  }) {
    return HistoryItemsTableCompanion(
      id: id ?? this.id,
      day: day ?? this.day,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DayTableTable dayTable = $DayTableTable(this);
  late final $CupsTableTable cupsTable = $CupsTableTable(this);
  late final $HistoryItemsTableTable historyItemsTable =
      $HistoryItemsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dayTable,
    cupsTable,
    historyItemsTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'day_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('history_items_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'day_table',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('history_items_table', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$DayTableTableCreateCompanionBuilder =
    DayTableCompanion Function({
      Value<int> id,
      required int dailyGoal,
      Value<int> currentAmount,
      required DateTime createdAt,
    });
typedef $$DayTableTableUpdateCompanionBuilder =
    DayTableCompanion Function({
      Value<int> id,
      Value<int> dailyGoal,
      Value<int> currentAmount,
      Value<DateTime> createdAt,
    });

final class $$DayTableTableReferences
    extends BaseReferences<_$AppDatabase, $DayTableTable, DayTableData> {
  $$DayTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $HistoryItemsTableTable,
    List<HistoryItemsTableData>
  >
  _historyItemsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.historyItemsTable,
        aliasName: $_aliasNameGenerator(
          db.dayTable.id,
          db.historyItemsTable.day,
        ),
      );

  $$HistoryItemsTableTableProcessedTableManager get historyItemsTableRefs {
    final manager = $$HistoryItemsTableTableTableManager(
      $_db,
      $_db.historyItemsTable,
    ).filter((f) => f.day.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _historyItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> historyItemsTableRefs(
    Expression<bool> Function($$HistoryItemsTableTableFilterComposer f) f,
  ) {
    final $$HistoryItemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historyItemsTable,
      getReferencedColumn: (t) => t.day,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryItemsTableTableFilterComposer(
            $db: $db,
            $table: $db.historyItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> historyItemsTableRefs<T extends Object>(
    Expression<T> Function($$HistoryItemsTableTableAnnotationComposer a) f,
  ) {
    final $$HistoryItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historyItemsTable,
          getReferencedColumn: (t) => t.day,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoryItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.historyItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (DayTableData, $$DayTableTableReferences),
          DayTableData,
          PrefetchHooks Function({bool historyItemsTableRefs})
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
                required DateTime createdAt,
              }) => DayTableCompanion.insert(
                id: id,
                dailyGoal: dailyGoal,
                currentAmount: currentAmount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({historyItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (historyItemsTableRefs) db.historyItemsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (historyItemsTableRefs)
                    await $_getPrefetchedData<
                      DayTableData,
                      $DayTableTable,
                      HistoryItemsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$DayTableTableReferences
                          ._historyItemsTableRefsTable(db),
                      managerFromTypedResult: (p0) => $$DayTableTableReferences(
                        db,
                        table,
                        p0,
                      ).historyItemsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.day == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (DayTableData, $$DayTableTableReferences),
      DayTableData,
      PrefetchHooks Function({bool historyItemsTableRefs})
    >;
typedef $$CupsTableTableCreateCompanionBuilder =
    CupsTableCompanion Function({
      Value<int> id,
      required int amount,
      Value<DateTime> createdAt,
    });
typedef $$CupsTableTableUpdateCompanionBuilder =
    CupsTableCompanion Function({
      Value<int> id,
      Value<int> amount,
      Value<DateTime> createdAt,
    });

class $$CupsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CupsTableTable> {
  $$CupsTableTableFilterComposer({
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

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CupsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CupsTableTable> {
  $$CupsTableTableOrderingComposer({
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

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CupsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CupsTableTable> {
  $$CupsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CupsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CupsTableTable,
          CupsTableData,
          $$CupsTableTableFilterComposer,
          $$CupsTableTableOrderingComposer,
          $$CupsTableTableAnnotationComposer,
          $$CupsTableTableCreateCompanionBuilder,
          $$CupsTableTableUpdateCompanionBuilder,
          (
            CupsTableData,
            BaseReferences<_$AppDatabase, $CupsTableTable, CupsTableData>,
          ),
          CupsTableData,
          PrefetchHooks Function()
        > {
  $$CupsTableTableTableManager(_$AppDatabase db, $CupsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CupsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CupsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CupsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CupsTableCompanion(
                id: id,
                amount: amount,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int amount,
                Value<DateTime> createdAt = const Value.absent(),
              }) => CupsTableCompanion.insert(
                id: id,
                amount: amount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CupsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CupsTableTable,
      CupsTableData,
      $$CupsTableTableFilterComposer,
      $$CupsTableTableOrderingComposer,
      $$CupsTableTableAnnotationComposer,
      $$CupsTableTableCreateCompanionBuilder,
      $$CupsTableTableUpdateCompanionBuilder,
      (
        CupsTableData,
        BaseReferences<_$AppDatabase, $CupsTableTable, CupsTableData>,
      ),
      CupsTableData,
      PrefetchHooks Function()
    >;
typedef $$HistoryItemsTableTableCreateCompanionBuilder =
    HistoryItemsTableCompanion Function({
      Value<int> id,
      required int day,
      required int amount,
      Value<DateTime> createdAt,
    });
typedef $$HistoryItemsTableTableUpdateCompanionBuilder =
    HistoryItemsTableCompanion Function({
      Value<int> id,
      Value<int> day,
      Value<int> amount,
      Value<DateTime> createdAt,
    });

final class $$HistoryItemsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HistoryItemsTableTable,
          HistoryItemsTableData
        > {
  $$HistoryItemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DayTableTable _dayTable(_$AppDatabase db) => db.dayTable.createAlias(
    $_aliasNameGenerator(db.historyItemsTable.day, db.dayTable.id),
  );

  $$DayTableTableProcessedTableManager get day {
    final $_column = $_itemColumn<int>('day')!;

    final manager = $$DayTableTableTableManager(
      $_db,
      $_db.dayTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HistoryItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryItemsTableTable> {
  $$HistoryItemsTableTableFilterComposer({
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

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DayTableTableFilterComposer get day {
    final $$DayTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.day,
      referencedTable: $db.dayTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTableTableFilterComposer(
            $db: $db,
            $table: $db.dayTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryItemsTableTable> {
  $$HistoryItemsTableTableOrderingComposer({
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

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DayTableTableOrderingComposer get day {
    final $$DayTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.day,
      referencedTable: $db.dayTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTableTableOrderingComposer(
            $db: $db,
            $table: $db.dayTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryItemsTableTable> {
  $$HistoryItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DayTableTableAnnotationComposer get day {
    final $$DayTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.day,
      referencedTable: $db.dayTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTableTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryItemsTableTable,
          HistoryItemsTableData,
          $$HistoryItemsTableTableFilterComposer,
          $$HistoryItemsTableTableOrderingComposer,
          $$HistoryItemsTableTableAnnotationComposer,
          $$HistoryItemsTableTableCreateCompanionBuilder,
          $$HistoryItemsTableTableUpdateCompanionBuilder,
          (HistoryItemsTableData, $$HistoryItemsTableTableReferences),
          HistoryItemsTableData,
          PrefetchHooks Function({bool day})
        > {
  $$HistoryItemsTableTableTableManager(
    _$AppDatabase db,
    $HistoryItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryItemsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> day = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => HistoryItemsTableCompanion(
                id: id,
                day: day,
                amount: amount,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int day,
                required int amount,
                Value<DateTime> createdAt = const Value.absent(),
              }) => HistoryItemsTableCompanion.insert(
                id: id,
                day: day,
                amount: amount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistoryItemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({day = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (day) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.day,
                                referencedTable:
                                    $$HistoryItemsTableTableReferences
                                        ._dayTable(db),
                                referencedColumn:
                                    $$HistoryItemsTableTableReferences
                                        ._dayTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HistoryItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryItemsTableTable,
      HistoryItemsTableData,
      $$HistoryItemsTableTableFilterComposer,
      $$HistoryItemsTableTableOrderingComposer,
      $$HistoryItemsTableTableAnnotationComposer,
      $$HistoryItemsTableTableCreateCompanionBuilder,
      $$HistoryItemsTableTableUpdateCompanionBuilder,
      (HistoryItemsTableData, $$HistoryItemsTableTableReferences),
      HistoryItemsTableData,
      PrefetchHooks Function({bool day})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DayTableTableTableManager get dayTable =>
      $$DayTableTableTableManager(_db, _db.dayTable);
  $$CupsTableTableTableManager get cupsTable =>
      $$CupsTableTableTableManager(_db, _db.cupsTable);
  $$HistoryItemsTableTableTableManager get historyItemsTable =>
      $$HistoryItemsTableTableTableManager(_db, _db.historyItemsTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'59cce38d45eeaba199eddd097d8e149d66f9f3e1';
