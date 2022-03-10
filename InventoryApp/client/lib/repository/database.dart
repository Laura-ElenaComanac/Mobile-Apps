import 'dart:async';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@DataClassName('EntityEntry')
class LocalEntitys extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100)();
  TextColumn get nume => text().withLength(min: 0, max: 100)();
  TextColumn get tip => text().withLength(min: 0, max: 100)();
  TextColumn get cantitate => text().withLength(min: 0, max: 100)();
  TextColumn get pret => text().withLength(min: 0, max: 100)();
  TextColumn get status => text().withLength(min: 0, max: 100)();
  TextColumn get discount => text().withLength(min: 0, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProductEntry')
class LocalProducts extends Table {
  TextColumn get id => text().withLength(min: 0, max: 100)();
  TextColumn get nume => text().withLength(min: 0, max: 100)();
  TextColumn get tip => text().withLength(min: 0, max: 100)();
  TextColumn get cantitate => text().withLength(min: 0, max: 100)();
  TextColumn get pret => text().withLength(min: 0, max: 100)();
  TextColumn get status => text().withLength(min: 0, max: 100)();
  TextColumn get discount => text().withLength(min: 0, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [
  LocalEntitys,
  LocalProducts
]) //, LocalColors, LocalEntityColors, LocalDrivers])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'database.sqlite', logStatements: true));

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        // if (from == 3) {
        //   await m.drop(localEntitys);
        //   await m.createTable(localEntitys);
        // }
        if (from == 4) {
          await m.createTable(localProducts);
        }
      });

  Future<void> deletAllProducts() => delete(localProducts).go();

  Future<void> insertProduct(ProductEntry entity) =>
      into(localProducts).insert(entity);

  Stream<List<ProductEntry>> watchProducts() => select(localProducts).watch();

  Future<void> deletAllEntities() => delete(localEntitys).go();

  Future<List<EntityEntry>> getEntitys() => select(localEntitys).get();

  Stream<List<EntityEntry>> watchEntitys() => select(localEntitys).watch();

  Stream<EntityEntry> entityById(String id) {
    return (select(localEntitys)..where((t) => t.id.equals(id))).watchSingle();
  }

  SingleSelectable<EntityEntry> entryById(String id) {
    return select(localEntitys)..where((t) => t.id.equals(id));
  }

  SingleSelectable<EntityEntry> entry(String id) {
    return select(localEntitys)..where((t) => t.id.equals(id));
  }

  Future<void> insertEntity(EntityEntry entity) =>
      into(localEntitys).insert(entity);

  Future<void> updateEntity(Insertable<EntityEntry> entity) =>
      update(localEntitys).replace(entity);

  Future<void> deleteEntity(EntityEntry entity) =>
      delete(localEntitys).delete(entity);

  Future<void> deleteEntityById(String id) {
    return (delete(localEntitys)..where((t) => t.id.equals(id))).go();
  }

  Future<void> updateEntitysById(EntityEntry entity) {
    return (update(localEntitys)..where((t) => t.id.equals(entity.id)))
        .write(entity);
  }

  // Stream<List<DriverEntry>> watchDrivers() => select(localDrivers).watch();

  // Future<void> insertDriver(DriverEntry driverEntry) =>
  //     into(localDrivers).insert(driverEntry);

  // Future<void> deletAllDrivers() => delete(localDrivers).go();

  // Stream<List<EntityColorEntry>> watchEntityColors() =>
  //     select(localEntityColors).watch();

  // Future<void> insertEntityColor(EntityColorEntry EntityColorEntry) =>
  //     into(localEntityColors).insert(EntityColorEntry);

  // Future<void> deletAllEntityColors() => delete(localEntityColors).go();

  // Stream<List<ColorEntry>> watchColors() => select(localColors).watch();

  // Future<void> insertColor(ColorEntry colorEntry) =>
  //     into(localColors).insert(colorEntry);

  // Future<void> deletAllColors() => delete(localColors).go();

}
