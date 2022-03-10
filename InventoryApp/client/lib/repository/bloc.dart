import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:examen/data/http_helper.dart';
import 'package:examen/model/entity.dart';

import 'database.dart';

class Bloc {
  late final Stream<List<EntityEntry>> _entitys;
  Stream<List<EntityEntry>> get homeScreenEntries => _entitys;

  bool _fetching = false;
  bool get fetching => _fetching;
  set setfetching(bool value) {
    _fetching = value;
  }

  late final EntityEntry _entity;
  ConnectivityResult connectivityResult = ConnectivityResult.wifi;

  late final Stream<List<ProductEntry>> _products;
  Stream<List<ProductEntry>> get productsEntries => _products;

  // late final Stream<List<EntityProductEntry>> _entitysWithstatus;
  // Stream<List<EntityProductEntry>> get entitysWithstatusEntries =>
  //     _entitysWithstatus;
  // late String _status;

  // late final Stream<List<pretEntry>> _prets;
  // Stream<List<pretEntry>> get pretEntries => _prets;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  var logger = Logger();
  final Database db;
  late HttpHelper h = HttpHelper();

  Bloc() : db = Database() {
    deleteALLDBEntries();
    db.deletAllProducts();
    // db.deletAllprets();

    updateEntities();
    _entitys = db.watchEntitys();

    getProducts();
    _products = db.watchProducts();

    // getprets();
    // _prets = db.watchprets();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      logger.d("Updated Connectivity! " + result.toString());
      connectivityResult = result;
    });
  }

  Connectivity getConnectivity() {
    return _connectivity;
  }

  EntityEntry get entity {
    return _entity;
  }

  void setEntity(EntityEntry entity) {
    _entity = entity;
  }

  // void retryGet() {}

  bool isConnected() {
    if (connectivityResult == ConnectivityResult.none) {
      logger.d("Not Connected!");
      return false;
    }
    logger.d("Connected!");
    return true;
  }

  Future<void> deleteALLDBEntries() async {
    logger.d('Deleting all entitys');
    try {
      await db.getEntitys().then((value) => {
            for (EntityEntry entityEntry in value)
              {deleteDBEntry(entityEntry.id)}
          });
      logger.d("done delete");
    } catch (error) {
      logger.d('Error Deleting db entitys: ' + error.toString());
      //throw Failure(error.toString());
      Fluttertoast.showToast(msg: "DEL entities error: " + error.toString());
    }
  }

  void updateEntities() async {
    logger.d("updateEntities");

    try {
      List<Entity>? entitys = await h.getEntitys();
      List<EntityEntry> localentitys = await db.getEntitys();

      if (entitys != null) {
        for (var entity in entitys) {
          bool found = false;

          for (var localEntity in localentitys) {
            if (entity.id == localEntity.id) found = true;
          }

          if (!found) {
            logger.d('Getting entity: ' + entity.toString());

            final entityC = EntityEntry(
                id: entity.id.toString(),
                nume: entity.nume,
                tip: entity.tip,
                cantitate: entity.cantitate.toString(),
                pret: entity.pret.toString(),
                status: entity.status.toString(),
                discount: entity.discount.toString());

            db.insertEntity(entityC);

            logger.d('Inserted Entity: ' + entityC.toString());
          }
        }
      } else {
        logger.d('Null from get');
        Fluttertoast.showToast(msg: "Adding entities error: null from GET");
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Adding entities error: " + error.toString());
    }
  }

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

  Future<void> _updateConnectiontip(
      ConnectivityResult result, EntityEntry entity) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        {
          logger.d('tip: online... adding: ' + entity.toString());
          Entity myEntity = Entity(
              id: -1,
              nume: entity.nume,
              tip: entity.tip,
              cantitate: int.parse(entity.cantitate),
              pret: int.parse(entity.pret),
              status: toBoolean(entity.status),
              discount: int.parse(entity.discount));
          try {
            h.addEntity(myEntity).then((value) {
              if (value != null) {
                logger.d('Added Entity to server: ' + myEntity.toString());
                db.deleteEntity(EntityEntry(
                    id: entity.id,
                    nume: entity.nume,
                    tip: entity.tip,
                    cantitate: entity.cantitate,
                    pret: entity.pret,
                    status: entity.status,
                    discount: entity.discount));

                db.insertEntity(EntityEntry(
                    id: value.id.toString(),
                    nume: value.nume,
                    tip: value.tip,
                    cantitate: value.cantitate.toString(),
                    pret: value.pret.toString(),
                    status: value.status.toString(),
                    discount: value.discount.toString()));
              } else {
                logger.d('failed to send Entity to server');
              }
            });
          } catch (error) {
            Fluttertoast.showToast(
                msg: "PUT entities error: " + error.toString());
          }
          break;
        }
      case ConnectivityResult.none:
        {
          logger.d('tip: offline');
          break;
        }
      default:
        logger.d('Failed to get connectivity.');
        break;
    }
  }

  Future<bool> addEntry(EntityEntry entity) async {
    try {
      logger.d('Adding given Entity: ' + entity.toString());

      Entity myEntity = Entity(
          id: -1,
          nume: entity.nume,
          tip: entity.tip,
          cantitate: int.parse(entity.cantitate),
          pret: int.parse(entity.pret),
          status: toBoolean(entity.status),
          discount: int.parse(entity.discount));

      EntityEntry entityE;

      h.addEntity(myEntity).then((value) => {
            if (value != null)
              {
                entityE = EntityEntry(
                    id: value.id.toString(),
                    nume: value.nume,
                    tip: value.tip,
                    cantitate: value.cantitate.toString(),
                    pret: value.pret.toString(),
                    status: value.status.toString(),
                    discount: value.discount.toString()),
                addDBEntry(entityE),
                logger.d('Added Entity to server: ' + entityE.toString()),
              }
            else
              {
                myEntity.id = Random().nextInt(1000000),
                entityE = EntityEntry(
                    id: Random().nextInt(1000000).toString(),
                    nume: myEntity.nume,
                    tip: myEntity.tip,
                    cantitate: myEntity.cantitate.toString(),
                    pret: myEntity.pret.toString(),
                    status: myEntity.status.toString(),
                    discount: myEntity.discount.toString()),
                db.insertEntity(entityE),
                logger
                    .d('Added fake Entity in local db: ' + myEntity.toString()),
                _connectivitySubscription = _connectivity.onConnectivityChanged
                    .listen((ConnectivityResult result) {
                  _updateConnectiontip(result, entityE);
                }),
              }
          });
    } catch (error) {
      logger.d('Error Adding given Entity: ' + error.toString());
      //throw Failure(error.toString());
      Fluttertoast.showToast(msg: "ADD entity error: " + error.toString());
    }

    var connectivityResult = await (Connectivity().checkConnectivity());
    logger.d('Connectivity: ' + connectivityResult.toString());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  void addDBEntry(EntityEntry entity) {
    try {
      db.insertEntity(entity);
      logger.d('Added entity in local db: ' + entity.toString());
    } catch (error) {
      logger.d('Error Adding db entity: ' + error.toString());
      //throw Failure(error.toString());
      Fluttertoast.showToast(msg: "Add db entity error: " + error.toString());
    }
  }

  void deleteEntry(String id) {
    try {
      logger.d('Deleting entity with the given id: ' + id);

      h.deleteEntity(id).then((value) => {
            db.deleteEntityById(value),
            logger.d('Deleted entity with the given id: ' + value)
          });
      // db.deleteEntityById(id);
    } catch (error) {
      logger.d('Error Deleting given entity: ' + error.toString());
      //throw Failure(error.toString());
      Fluttertoast.showToast(msg: "DEL entries error: " + error.toString());
    }
  }

  void deleteDBEntry(String id) {
    try {
      logger.d('Deleting entity with the given id: ' + id);
      db.deleteEntityById(id);
    } catch (error) {
      logger.d('Error Deleting db entity: ' + error.toString());
      //throw Failure(error.toString());
      Fluttertoast.showToast(msg: "DEL db entries error: " + error.toString());
    }
  }

  Future<List<EntityEntry>> getEntries() {
    return db.getEntitys();
  }

  void close() {
    db.close();
    _connectivitySubscription.cancel();
  }

  void deleteAllProducts() {
    try {
      db.deletAllProducts();
    } catch (error) {
      Fluttertoast.showToast(msg: "DEL products error: " + error.toString());
    }
  }

  Future<void> getProducts() async {
    Map<String, Entity> map = new Map();
    try {
      h.getEntitys().then((value) => {
            for (Entity val in value!)
              {
                if (map.containsKey(val.tip))
                  {
                    if (map[val.tip]!.pret > val.pret)
                      map.update(val.tip, (value) => val)
                  }
                else
                  {map.putIfAbsent(val.tip, () => val)}
              },
            for (var m in map.values)
              {
                db.insertProduct(ProductEntry(
                    id: m.id.toString(),
                    nume: m.nume,
                    tip: m.tip,
                    cantitate: m.cantitate.toString(),
                    pret: m.pret.toString(),
                    status: m.status.toString(),
                    discount: m.discount.toString())),
                logger.d("inserted product: " + m.toString()),
              }
          });
    } catch (error) {
      logger.d(error.toString());
      Fluttertoast.showToast(msg: "GET products error: " + error.toString());
      //rethrow;
    }
  }
}

class Failure extends IOException {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

  // // void setentitys(List<Entity> entitys) async {
  // //   List<EntityEntry> localentitys = await db.getentitys();
  // //
  // //   for (var Entity in entitys) {
  // //     bool found = false;
  // //
  // //     for (var localentity in localentitys) {
  // //       if (entity.id == localentity.id) found = true;
  // //     }
  // //
  // //     if (!found) {
  // //       logger.d('Getting entity: ' + entity.toString());
  // //
  // //       final entityC = EntityEntry(
  // //           id: entity.id,
  // //           entityname: entity.entityname,
  // //           password: entity.password,
  // //           firstname: entity.firstname,
  // //           lastname: entity.lastname,
  // //           gender: entity.gender);
  // //
  // //       db.insertentity(entityC);
  // //
  // //       logger.d('Inserted entity: ' + entityC.toString());
  // //     }
  // //   }
  // // }
  // //

  // Future<void> getprets() async {
  //   try {
  //     int nr;
  //     h.getprets().then((value) => {
  //           if (value != null)
  //             {
  //               value.sort((a, b) => b.cantitate.compareTo(a.cantitate)),
  //               //value.reversed,
  //               nr = 0,
  //               for (Entity val in value)
  //                 if (nr < 5)
  //                   {
  //                     db.insertpret(pretEntry(
  //                         id: val.id.toString(),
  //                         nume: val.nume,
  //                         tip: val.tip,
  //                         cantitate: val.cantitate.toString(),
  //                         pret: val.pret,
  //                         status: val.status,
  //                         discount: val.discount.toString())),
  //                     logger.d("inserted pret: " + val.toString()),
  //                     nr++
  //                   }
  //             }
  //         });
  //   } catch (error) {
  //     logger.d(error.toString());
  //     rethrow;
  //   }
  // }

  // Future<void> getEntitysWithstatus() async {
  //   try {
  //     h.getEntitysstatus(_status).then((value) => {
  //           if (value != null)
  //             {
  //               for (Entity val in value)
  //                 {
  //                   db.insertEntitystatus(EntityProductEntry(
  //                       id: val.id.toString(),
  //                       nume: val.nume,
  //                       tip: val.tip,
  //                       cantitate: val.cantitate.toString(),
  //                       pret: val.pret,
  //                       status: val.status,
  //                       discount: val.discount.toString())),
  //                   logger.d("inserted Entity with status: " + val.toString())
  //                 }
  //             }
  //         });
  //   } catch (error) {
  //     logger.d(error.toString());
  //     rethrow;
  //   }
  // }

  // void setstatus(String status) {
  //   _status = status;
  // }

  
