// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlantsTable extends Plants with drift.TableInfo<$PlantsTable, Plant> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: drift.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          drift.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _nameMeta =
      const drift.VerificationMeta('name');
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: drift.DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _priceMeta =
      const drift.VerificationMeta('price');
  @override
  late final drift.GeneratedColumn<double> price =
      drift.GeneratedColumn<double>('price', aliasedName, false,
          type: drift.DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _ageMeta =
      const drift.VerificationMeta('age');
  @override
  late final drift.GeneratedColumn<int> age = drift.GeneratedColumn<int>(
      'age', aliasedName, false,
      type: drift.DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, name, price, age];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plants';
  @override
  drift.VerificationContext validateIntegrity(drift.Insertable<Plant> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  Plant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plant(
      id: attachedDatabase.typeMapping
          .read(drift.DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(drift.DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(drift.DriftSqlType.double, data['${effectivePrefix}price'])!,
      age: attachedDatabase.typeMapping
          .read(drift.DriftSqlType.int, data['${effectivePrefix}age'])!,
    );
  }

  @override
  $PlantsTable createAlias(String alias) {
    return $PlantsTable(attachedDatabase, alias);
  }
}

class Plant extends drift.DataClass implements drift.Insertable<Plant> {
  final int id;
  final String name;
  final double price;
  final int age;
  const Plant(
      {required this.id,
      required this.name,
      required this.price,
      required this.age});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['name'] = drift.Variable<String>(name);
    map['price'] = drift.Variable<double>(price);
    map['age'] = drift.Variable<int>(age);
    return map;
  }

  PlantsCompanion toCompanion(bool nullToAbsent) {
    return PlantsCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      price: drift.Value(price),
      age: drift.Value(age),
    );
  }

  factory Plant.fromJson(Map<String, dynamic> json,
      {drift.ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Plant(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({drift.ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'age': serializer.toJson<int>(age),
    };
  }

  Plant copyWith({int? id, String? name, double? price, int? age}) => Plant(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        age: age ?? this.age,
      );
  Plant copyWithCompanion(PlantsCompanion data) {
    return Plant(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      age: data.age.present ? data.age.value : this.age,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plant(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plant &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.age == this.age);
}

class PlantsCompanion extends drift.UpdateCompanion<Plant> {
  final drift.Value<int> id;
  final drift.Value<String> name;
  final drift.Value<double> price;
  final drift.Value<int> age;
  const PlantsCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.price = const drift.Value.absent(),
    this.age = const drift.Value.absent(),
  });
  PlantsCompanion.insert({
    this.id = const drift.Value.absent(),
    required String name,
    required double price,
    required int age,
  })  : name = drift.Value(name),
        price = drift.Value(price),
        age = drift.Value(age);
  static drift.Insertable<Plant> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? name,
    drift.Expression<double>? price,
    drift.Expression<int>? age,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (age != null) 'age': age,
    });
  }

  PlantsCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? name,
      drift.Value<double>? price,
      drift.Value<int>? age}) {
    return PlantsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = drift.Variable<double>(price.value);
    }
    if (age.present) {
      map['age'] = drift.Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends drift.GeneratedDatabase {
  _$AppDatabase(drift.QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlantsTable plants = $PlantsTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities => [plants];
}

typedef $$PlantsTableCreateCompanionBuilder = PlantsCompanion Function({
  drift.Value<int> id,
  required String name,
  required double price,
  required int age,
});
typedef $$PlantsTableUpdateCompanionBuilder = PlantsCompanion Function({
  drift.Value<int> id,
  drift.Value<String> name,
  drift.Value<double> price,
  drift.Value<int> age,
});

class $$PlantsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $PlantsTable> {
  $$PlantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => drift.ColumnFilters(column));
}

class $$PlantsTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $PlantsTable> {
  $$PlantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => drift.ColumnOrderings(column));
}

class $$PlantsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $PlantsTable> {
  $$PlantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  drift.GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);
}

class $$PlantsTableTableManager extends drift.RootTableManager<
    _$AppDatabase,
    $PlantsTable,
    Plant,
    $$PlantsTableFilterComposer,
    $$PlantsTableOrderingComposer,
    $$PlantsTableAnnotationComposer,
    $$PlantsTableCreateCompanionBuilder,
    $$PlantsTableUpdateCompanionBuilder,
    (Plant, drift.BaseReferences<_$AppDatabase, $PlantsTable, Plant>),
    Plant,
    drift.PrefetchHooks Function()> {
  $$PlantsTableTableManager(_$AppDatabase db, $PlantsTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> name = const drift.Value.absent(),
            drift.Value<double> price = const drift.Value.absent(),
            drift.Value<int> age = const drift.Value.absent(),
          }) =>
              PlantsCompanion(
            id: id,
            name: name,
            price: price,
            age: age,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String name,
            required double price,
            required int age,
          }) =>
              PlantsCompanion.insert(
            id: id,
            name: name,
            price: price,
            age: age,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlantsTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDatabase,
    $PlantsTable,
    Plant,
    $$PlantsTableFilterComposer,
    $$PlantsTableOrderingComposer,
    $$PlantsTableAnnotationComposer,
    $$PlantsTableCreateCompanionBuilder,
    $$PlantsTableUpdateCompanionBuilder,
    (Plant, drift.BaseReferences<_$AppDatabase, $PlantsTable, Plant>),
    Plant,
    drift.PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlantsTableTableManager get plants =>
      $$PlantsTableTableManager(_db, _db.plants);
}
