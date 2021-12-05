
import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';

class DistrictModelResponse {
  int? _count;
  List<Regions>? _regions;

  int? get count => _count;
  List<Regions>? get regions => _regions;

  DistrictModelResponse({
      int? count, 
      List<Regions>? regions}){
    _count = count;
    _regions = regions;
}

  DistrictModelResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['regions'] != null) {
      _regions = [];
      json['regions'].forEach((v) {
        _regions?.add(Regions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    if (_regions != null) {
      map['regions'] = _regions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "611380763b56884e1ee48cfb"
/// ru_name : "Районы Наманганской области"
/// name : "Namangan viloyatining tumanlari"
/// soato : 1714200
/// code : 200
/// city : {"id":"6113805291d80c04dc0fa91a","ru_name":"Наманганская область","name":"Namangan viloyati","soato":1714,"code":14}

class Regions extends Region{
  String? _id;
  String? _ruName;
  String? _name;
  int? _soato;
  int? _code;
  City? _city;

  String? get id => _id;
  String? get ruName => _ruName;
  String? get name => _name;
  int? get soato => _soato;
  int? get code => _code;
  City? get city => _city;

  Regions({
      String? id, 
      String? ruName, 
      String? name, 
      int? soato, 
      int? code, 
      City? city}){
    _id = id;
    _ruName = ruName;
    _name = name;
    _soato = soato;
    _code = code;
    _city = city;
}

  Regions.fromJson(dynamic json) {
    _id = json['id'];
    _ruName = json['ru_name'];
    _name = json['name'];
    _soato = json['soato'];
    _code = json['code'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['ru_name'] = _ruName;
    map['name'] = _name;
    map['soato'] = _soato;
    map['code'] = _code;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    return map;
  }

}

/// id : "6113805291d80c04dc0fa91a"
/// ru_name : "Наманганская область"
/// name : "Namangan viloyati"
/// soato : 1714
/// code : 14

class City {
  String? _id;
  String? _ruName;
  String? _name;
  int? _soato;
  int? _code;

  String? get id => _id;
  String? get ruName => _ruName;
  String? get name => _name;
  int? get soato => _soato;
  int? get code => _code;

  City({
      String? id, 
      String? ruName, 
      String? name, 
      int? soato, 
      int? code}){
    _id = id;
    _ruName = ruName;
    _name = name;
    _soato = soato;
    _code = code;
}

  City.fromJson(dynamic json) {
    _id = json['id'];
    _ruName = json['ru_name'];
    _name = json['name'];
    _soato = json['soato'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['ru_name'] = _ruName;
    map['name'] = _name;
    map['soato'] = _soato;
    map['code'] = _code;
    return map;
  }

}