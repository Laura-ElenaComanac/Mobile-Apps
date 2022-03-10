import 'dart:convert';
import 'package:examen/model/entity.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpHelper {
  final String authority = '192.168.0.118:3000';
  final String path = 'products';
  final String addpath = 'product';

  final String deletepath = 'vehicle';

  var logger = Logger();

  Future<List<Entity>?> getEntitys() async {
    logger.d('Getting Entitys from the server');

    List<Entity> entitys = [];

    try {
      Uri uri = Uri.http(authority, path);
      http.Response result = await http.get(uri);

      var data = json.decode(result.body) as List;

      for (var entity in data) {
        Entity myEntity = Entity.fromJson(entity);
        entitys.add(myEntity);
      }

      logger.d('Got Entitys from the server: ' + data.toString());

      return entitys;
    } catch (error) {
      logger.d("error on  get: " + error.toString());
      //rethrow;
      return null;
    }
  }

  Future<Entity?> addEntity(Entity entity) async {
    Map<String, dynamic> parameters = {
      'id': entity.id,
      'nume': entity.nume,
      'tip': entity.tip,
      'cantitate': entity.cantitate,
      'pret': entity.pret,
      'status': entity.status,
      'discount': entity.discount
    };

    Entity? myEntity;
    try {
      logger.d('!!!!ADD Entity!!!!');

      Uri uri = Uri.http(authority, addpath);
      http.Response result = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(parameters),
      );

      logger.d('!!!!addEntity result1: ' + result.body);

      // var data = json.decode(result.body);
      // logger.d('!!!!addEntity result2: ' + data);
      // myEntity = Entity.fromJson(data);

      if (result.statusCode == 200) {
        logger.d('Sent Entity!');
        return Entity.fromJson(jsonDecode(result.body));
      } else {
        logger.d('Failed to create Entity: ' + result.statusCode.toString());
      }
    } catch (error) {
      logger.d("addEntity error: " + error.toString());
      return null;
    }

    return myEntity;
  }

  Future<String> deleteEntity(String id) async {
    logger.d('!!!!DELETE Entity!!!!');

    Map<String, dynamic> parameters = {'id': id};

    Uri uri = Uri.http(authority, deletepath + "/" + id);
    http.Response result = await http.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(parameters),
    );

    logger.d('!!!!deleteEntity result1: ' + result.body);

    if (result.statusCode == 200) {
      logger.d('Sent Entity!');
    } else {
      logger.d('Failed to delete Entity: ' + result.statusCode.toString());
    }

    return result.body;
  }

  // Future<List<String>> getstatuss() async {
  //   logger.d('Getting statuss from the server');

  //   List<String> statuss = [];

  //   try {
  //     Uri uri = Uri.http(authority, 'statuss');
  //     http.Response result = await http.get(uri);

  //     var data = json.decode(result.body) as List;

  //     for (var status in data) {
  //       statuss.add(status);
  //     }

  //     logger.d('Got statuss from the server: ' + data.toString());

  //     return statuss;
  //   } catch (error) {
  //     logger.d("error on  get statuss: " + error.toString());
  //     rethrow;
  //   }
  // }

  // Future<List<Entity>?> getEntitysstatus(String status) async {
  //   logger.d('Getting Entitys with status from the server');

  //   List<Entity> entitys = [];

  //   try {
  //     Uri uri = Uri.http(authority, '/vehicles/' + status);
  //     http.Response result = await http.get(uri);

  //     var data = json.decode(result.body) as List;

  //     for (var entity in data) {
  //       Entity myEntity = Entity.fromJson(entity);
  //       entitys.add(myEntity);
  //     }

  //     logger.d('Got Entitys with status ' +
  //         status +
  //         ' from the server: ' +
  //         data.toString());

  //     return entitys;
  //   } catch (error) {
  //     logger.d("error on  get: " + error.toString());
  //     rethrow;
  //     //return null;
  //   }
  // }

  // Future<List<Entity>?> getprets() async {
  //   logger.d('Getting prets from the server');

  //   List<Entity> entitys = [];

  //   try {
  //     Uri uri = Uri.http(authority, '/all');
  //     http.Response result = await http.get(uri);

  //     var data = json.decode(result.body) as List;

  //     for (var entity in data) {
  //       Entity myEntity = Entity.fromJson(entity);
  //       entitys.add(myEntity);
  //     }

  //     logger.d('Got prets from the server: ' + data.toString());

  //     return entitys;
  //   } catch (error) {
  //     logger.d("error on  get: " + error.toString());
  //     //rethrow;
  //     return null;
  //   }
  // }

}
