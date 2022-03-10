import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Entity {
  int _id;
  int get id => _id;

  String _nume;
  String get nume => _nume;

  String _tip;
  String get tip => _tip;

  int _cantitate;
  int get cantitate => _cantitate;

  int _pret;
  int get pret => _pret;

  bool _status;
  bool get status => _status;

  int _discount;
  int get discount => _discount;

  set id(int value) {
    _id = value;
  }

  Entity({
    required int id,
    required String nume,
    required String tip,
    required int cantitate,
    required int pret,
    required bool status,
    required int discount,
  })  : _id = id,
        _nume = nume,
        _tip = tip,
        _cantitate = cantitate,
        _pret = pret,
        _status = status,
        _discount = discount;

  factory Entity.fromJson(Map<String, dynamic> entityMap) {
    return Entity(
        id: entityMap['id'] as int,
        nume: entityMap['nume'] as String,
        tip: entityMap['tip'] as String,
        cantitate: entityMap['cantitate'] as int,
        pret: entityMap['pret'] as int,
        status: entityMap['status'] as bool,
        discount: entityMap['discount'] as int);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> entityMap = {
      'id': _id,
      'nume': _nume,
      'tip': _tip,
      'cantitate': _cantitate,
      'pret': _pret,
      'status': _status,
      'discount': _discount,
    };
    return entityMap;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity && runtimeType == other.runtimeType && _id == other._id;

  @override
  int get hashCode => _id.hashCode;

  @override
  String toString() {
    return 'Product{_id: $_id, _nume: $_nume, _tip: $_tip, _cantitate: $_cantitate, _pret: $_pret, _status: $_status, _discount: $_discount}';
  }
}
