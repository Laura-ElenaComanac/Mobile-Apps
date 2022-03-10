// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class EntityEntry extends DataClass implements Insertable<EntityEntry> {
  final String id;
  final String nume;
  final String tip;
  final String cantitate;
  final String pret;
  final String status;
  final String discount;
  EntityEntry(
      {required this.id,
      required this.nume,
      required this.tip,
      required this.cantitate,
      required this.pret,
      required this.status,
      required this.discount});
  factory EntityEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return EntityEntry(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nume: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nume'])!,
      tip: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tip'])!,
      cantitate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantitate'])!,
      pret: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pret'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      discount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nume'] = Variable<String>(nume);
    map['tip'] = Variable<String>(tip);
    map['cantitate'] = Variable<String>(cantitate);
    map['pret'] = Variable<String>(pret);
    map['status'] = Variable<String>(status);
    map['discount'] = Variable<String>(discount);
    return map;
  }

  LocalEntitysCompanion toCompanion(bool nullToAbsent) {
    return LocalEntitysCompanion(
      id: Value(id),
      nume: Value(nume),
      tip: Value(tip),
      cantitate: Value(cantitate),
      pret: Value(pret),
      status: Value(status),
      discount: Value(discount),
    );
  }

  factory EntityEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EntityEntry(
      id: serializer.fromJson<String>(json['id']),
      nume: serializer.fromJson<String>(json['nume']),
      tip: serializer.fromJson<String>(json['tip']),
      cantitate: serializer.fromJson<String>(json['cantitate']),
      pret: serializer.fromJson<String>(json['pret']),
      status: serializer.fromJson<String>(json['status']),
      discount: serializer.fromJson<String>(json['discount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nume': serializer.toJson<String>(nume),
      'tip': serializer.toJson<String>(tip),
      'cantitate': serializer.toJson<String>(cantitate),
      'pret': serializer.toJson<String>(pret),
      'status': serializer.toJson<String>(status),
      'discount': serializer.toJson<String>(discount),
    };
  }

  EntityEntry copyWith(
          {String? id,
          String? nume,
          String? tip,
          String? cantitate,
          String? pret,
          String? status,
          String? discount}) =>
      EntityEntry(
        id: id ?? this.id,
        nume: nume ?? this.nume,
        tip: tip ?? this.tip,
        cantitate: cantitate ?? this.cantitate,
        pret: pret ?? this.pret,
        status: status ?? this.status,
        discount: discount ?? this.discount,
      );
  @override
  String toString() {
    return (StringBuffer('EntityEntry(')
          ..write('id: $id, ')
          ..write('nume: $nume, ')
          ..write('tip: $tip, ')
          ..write('cantitate: $cantitate, ')
          ..write('pret: $pret, ')
          ..write('status: $status, ')
          ..write('discount: $discount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nume, tip, cantitate, pret, status, discount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntityEntry &&
          other.id == this.id &&
          other.nume == this.nume &&
          other.tip == this.tip &&
          other.cantitate == this.cantitate &&
          other.pret == this.pret &&
          other.status == this.status &&
          other.discount == this.discount);
}

class LocalEntitysCompanion extends UpdateCompanion<EntityEntry> {
  final Value<String> id;
  final Value<String> nume;
  final Value<String> tip;
  final Value<String> cantitate;
  final Value<String> pret;
  final Value<String> status;
  final Value<String> discount;
  const LocalEntitysCompanion({
    this.id = const Value.absent(),
    this.nume = const Value.absent(),
    this.tip = const Value.absent(),
    this.cantitate = const Value.absent(),
    this.pret = const Value.absent(),
    this.status = const Value.absent(),
    this.discount = const Value.absent(),
  });
  LocalEntitysCompanion.insert({
    required String id,
    required String nume,
    required String tip,
    required String cantitate,
    required String pret,
    required String status,
    required String discount,
  })  : id = Value(id),
        nume = Value(nume),
        tip = Value(tip),
        cantitate = Value(cantitate),
        pret = Value(pret),
        status = Value(status),
        discount = Value(discount);
  static Insertable<EntityEntry> custom({
    Expression<String>? id,
    Expression<String>? nume,
    Expression<String>? tip,
    Expression<String>? cantitate,
    Expression<String>? pret,
    Expression<String>? status,
    Expression<String>? discount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nume != null) 'nume': nume,
      if (tip != null) 'tip': tip,
      if (cantitate != null) 'cantitate': cantitate,
      if (pret != null) 'pret': pret,
      if (status != null) 'status': status,
      if (discount != null) 'discount': discount,
    });
  }

  LocalEntitysCompanion copyWith(
      {Value<String>? id,
      Value<String>? nume,
      Value<String>? tip,
      Value<String>? cantitate,
      Value<String>? pret,
      Value<String>? status,
      Value<String>? discount}) {
    return LocalEntitysCompanion(
      id: id ?? this.id,
      nume: nume ?? this.nume,
      tip: tip ?? this.tip,
      cantitate: cantitate ?? this.cantitate,
      pret: pret ?? this.pret,
      status: status ?? this.status,
      discount: discount ?? this.discount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nume.present) {
      map['nume'] = Variable<String>(nume.value);
    }
    if (tip.present) {
      map['tip'] = Variable<String>(tip.value);
    }
    if (cantitate.present) {
      map['cantitate'] = Variable<String>(cantitate.value);
    }
    if (pret.present) {
      map['pret'] = Variable<String>(pret.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (discount.present) {
      map['discount'] = Variable<String>(discount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalEntitysCompanion(')
          ..write('id: $id, ')
          ..write('nume: $nume, ')
          ..write('tip: $tip, ')
          ..write('cantitate: $cantitate, ')
          ..write('pret: $pret, ')
          ..write('status: $status, ')
          ..write('discount: $discount')
          ..write(')'))
        .toString();
  }
}

class $LocalEntitysTable extends LocalEntitys
    with TableInfo<$LocalEntitysTable, EntityEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LocalEntitysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _numeMeta = const VerificationMeta('nume');
  late final GeneratedColumn<String?> nume = GeneratedColumn<String?>(
      'nume', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _tipMeta = const VerificationMeta('tip');
  late final GeneratedColumn<String?> tip = GeneratedColumn<String?>(
      'tip', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _cantitateMeta = const VerificationMeta('cantitate');
  late final GeneratedColumn<String?> cantitate = GeneratedColumn<String?>(
      'cantitate', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _pretMeta = const VerificationMeta('pret');
  late final GeneratedColumn<String?> pret = GeneratedColumn<String?>(
      'pret', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _discountMeta = const VerificationMeta('discount');
  late final GeneratedColumn<String?> discount = GeneratedColumn<String?>(
      'discount', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nume, tip, cantitate, pret, status, discount];
  @override
  String get aliasedName => _alias ?? 'local_entitys';
  @override
  String get actualTableName => 'local_entitys';
  @override
  VerificationContext validateIntegrity(Insertable<EntityEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nume')) {
      context.handle(
          _numeMeta, nume.isAcceptableOrUnknown(data['nume']!, _numeMeta));
    } else if (isInserting) {
      context.missing(_numeMeta);
    }
    if (data.containsKey('tip')) {
      context.handle(
          _tipMeta, tip.isAcceptableOrUnknown(data['tip']!, _tipMeta));
    } else if (isInserting) {
      context.missing(_tipMeta);
    }
    if (data.containsKey('cantitate')) {
      context.handle(_cantitateMeta,
          cantitate.isAcceptableOrUnknown(data['cantitate']!, _cantitateMeta));
    } else if (isInserting) {
      context.missing(_cantitateMeta);
    }
    if (data.containsKey('pret')) {
      context.handle(
          _pretMeta, pret.isAcceptableOrUnknown(data['pret']!, _pretMeta));
    } else if (isInserting) {
      context.missing(_pretMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    } else if (isInserting) {
      context.missing(_discountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntityEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return EntityEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocalEntitysTable createAlias(String alias) {
    return $LocalEntitysTable(_db, alias);
  }
}

class ProductEntry extends DataClass implements Insertable<ProductEntry> {
  final String id;
  final String nume;
  final String tip;
  final String cantitate;
  final String pret;
  final String status;
  final String discount;
  ProductEntry(
      {required this.id,
      required this.nume,
      required this.tip,
      required this.cantitate,
      required this.pret,
      required this.status,
      required this.discount});
  factory ProductEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductEntry(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nume: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nume'])!,
      tip: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tip'])!,
      cantitate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cantitate'])!,
      pret: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pret'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      discount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nume'] = Variable<String>(nume);
    map['tip'] = Variable<String>(tip);
    map['cantitate'] = Variable<String>(cantitate);
    map['pret'] = Variable<String>(pret);
    map['status'] = Variable<String>(status);
    map['discount'] = Variable<String>(discount);
    return map;
  }

  LocalProductsCompanion toCompanion(bool nullToAbsent) {
    return LocalProductsCompanion(
      id: Value(id),
      nume: Value(nume),
      tip: Value(tip),
      cantitate: Value(cantitate),
      pret: Value(pret),
      status: Value(status),
      discount: Value(discount),
    );
  }

  factory ProductEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductEntry(
      id: serializer.fromJson<String>(json['id']),
      nume: serializer.fromJson<String>(json['nume']),
      tip: serializer.fromJson<String>(json['tip']),
      cantitate: serializer.fromJson<String>(json['cantitate']),
      pret: serializer.fromJson<String>(json['pret']),
      status: serializer.fromJson<String>(json['status']),
      discount: serializer.fromJson<String>(json['discount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nume': serializer.toJson<String>(nume),
      'tip': serializer.toJson<String>(tip),
      'cantitate': serializer.toJson<String>(cantitate),
      'pret': serializer.toJson<String>(pret),
      'status': serializer.toJson<String>(status),
      'discount': serializer.toJson<String>(discount),
    };
  }

  ProductEntry copyWith(
          {String? id,
          String? nume,
          String? tip,
          String? cantitate,
          String? pret,
          String? status,
          String? discount}) =>
      ProductEntry(
        id: id ?? this.id,
        nume: nume ?? this.nume,
        tip: tip ?? this.tip,
        cantitate: cantitate ?? this.cantitate,
        pret: pret ?? this.pret,
        status: status ?? this.status,
        discount: discount ?? this.discount,
      );
  @override
  String toString() {
    return (StringBuffer('ProductEntry(')
          ..write('id: $id, ')
          ..write('nume: $nume, ')
          ..write('tip: $tip, ')
          ..write('cantitate: $cantitate, ')
          ..write('pret: $pret, ')
          ..write('status: $status, ')
          ..write('discount: $discount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nume, tip, cantitate, pret, status, discount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductEntry &&
          other.id == this.id &&
          other.nume == this.nume &&
          other.tip == this.tip &&
          other.cantitate == this.cantitate &&
          other.pret == this.pret &&
          other.status == this.status &&
          other.discount == this.discount);
}

class LocalProductsCompanion extends UpdateCompanion<ProductEntry> {
  final Value<String> id;
  final Value<String> nume;
  final Value<String> tip;
  final Value<String> cantitate;
  final Value<String> pret;
  final Value<String> status;
  final Value<String> discount;
  const LocalProductsCompanion({
    this.id = const Value.absent(),
    this.nume = const Value.absent(),
    this.tip = const Value.absent(),
    this.cantitate = const Value.absent(),
    this.pret = const Value.absent(),
    this.status = const Value.absent(),
    this.discount = const Value.absent(),
  });
  LocalProductsCompanion.insert({
    required String id,
    required String nume,
    required String tip,
    required String cantitate,
    required String pret,
    required String status,
    required String discount,
  })  : id = Value(id),
        nume = Value(nume),
        tip = Value(tip),
        cantitate = Value(cantitate),
        pret = Value(pret),
        status = Value(status),
        discount = Value(discount);
  static Insertable<ProductEntry> custom({
    Expression<String>? id,
    Expression<String>? nume,
    Expression<String>? tip,
    Expression<String>? cantitate,
    Expression<String>? pret,
    Expression<String>? status,
    Expression<String>? discount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nume != null) 'nume': nume,
      if (tip != null) 'tip': tip,
      if (cantitate != null) 'cantitate': cantitate,
      if (pret != null) 'pret': pret,
      if (status != null) 'status': status,
      if (discount != null) 'discount': discount,
    });
  }

  LocalProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? nume,
      Value<String>? tip,
      Value<String>? cantitate,
      Value<String>? pret,
      Value<String>? status,
      Value<String>? discount}) {
    return LocalProductsCompanion(
      id: id ?? this.id,
      nume: nume ?? this.nume,
      tip: tip ?? this.tip,
      cantitate: cantitate ?? this.cantitate,
      pret: pret ?? this.pret,
      status: status ?? this.status,
      discount: discount ?? this.discount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nume.present) {
      map['nume'] = Variable<String>(nume.value);
    }
    if (tip.present) {
      map['tip'] = Variable<String>(tip.value);
    }
    if (cantitate.present) {
      map['cantitate'] = Variable<String>(cantitate.value);
    }
    if (pret.present) {
      map['pret'] = Variable<String>(pret.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (discount.present) {
      map['discount'] = Variable<String>(discount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalProductsCompanion(')
          ..write('id: $id, ')
          ..write('nume: $nume, ')
          ..write('tip: $tip, ')
          ..write('cantitate: $cantitate, ')
          ..write('pret: $pret, ')
          ..write('status: $status, ')
          ..write('discount: $discount')
          ..write(')'))
        .toString();
  }
}

class $LocalProductsTable extends LocalProducts
    with TableInfo<$LocalProductsTable, ProductEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LocalProductsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _numeMeta = const VerificationMeta('nume');
  late final GeneratedColumn<String?> nume = GeneratedColumn<String?>(
      'nume', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _tipMeta = const VerificationMeta('tip');
  late final GeneratedColumn<String?> tip = GeneratedColumn<String?>(
      'tip', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _cantitateMeta = const VerificationMeta('cantitate');
  late final GeneratedColumn<String?> cantitate = GeneratedColumn<String?>(
      'cantitate', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _pretMeta = const VerificationMeta('pret');
  late final GeneratedColumn<String?> pret = GeneratedColumn<String?>(
      'pret', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _discountMeta = const VerificationMeta('discount');
  late final GeneratedColumn<String?> discount = GeneratedColumn<String?>(
      'discount', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nume, tip, cantitate, pret, status, discount];
  @override
  String get aliasedName => _alias ?? 'local_products';
  @override
  String get actualTableName => 'local_products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nume')) {
      context.handle(
          _numeMeta, nume.isAcceptableOrUnknown(data['nume']!, _numeMeta));
    } else if (isInserting) {
      context.missing(_numeMeta);
    }
    if (data.containsKey('tip')) {
      context.handle(
          _tipMeta, tip.isAcceptableOrUnknown(data['tip']!, _tipMeta));
    } else if (isInserting) {
      context.missing(_tipMeta);
    }
    if (data.containsKey('cantitate')) {
      context.handle(_cantitateMeta,
          cantitate.isAcceptableOrUnknown(data['cantitate']!, _cantitateMeta));
    } else if (isInserting) {
      context.missing(_cantitateMeta);
    }
    if (data.containsKey('pret')) {
      context.handle(
          _pretMeta, pret.isAcceptableOrUnknown(data['pret']!, _pretMeta));
    } else if (isInserting) {
      context.missing(_pretMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    } else if (isInserting) {
      context.missing(_discountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocalProductsTable createAlias(String alias) {
    return $LocalProductsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LocalEntitysTable localEntitys = $LocalEntitysTable(this);
  late final $LocalProductsTable localProducts = $LocalProductsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [localEntitys, localProducts];
}
