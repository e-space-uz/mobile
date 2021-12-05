import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';

/// count : 0
/// districts : [{"city":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"code":0,"id":"string","name":"string","region":{"city":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"ru_name":"string","soato":0}]

class VillageModelResponse {
  int? _count;
  List<Districts>? _districts;

  int? get count => _count;
  List<Districts>? get districts => _districts;

  VillageModelResponse({
      int? count, 
      List<Districts>? districts}){
    _count = count;
    _districts = districts;
}

  VillageModelResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['districts'] != null) {
      _districts = [];
      json['districts'].forEach((v) {
        _districts?.add(Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    if (_districts != null) {
      map['districts'] = _districts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// city : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// code : 0
/// id : "string"
/// name : "string"
/// region : {"city":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// ru_name : "string"
/// soato : 0

class Districts extends District{
  City? _city;
  int? _code;
  String? _id;
  String? _name;
  Region? _region;
  String? _ruName;
  int? _soato;

  City? get city => _city;
  int? get code => _code;
  String? get id => _id;
  String? get name => _name;
  Region? get region => _region;
  String? get ruName => _ruName;
  int? get soato => _soato;

  Districts({
      City? city, 
      int? code, 
      String? id, 
      String? name, 
      Region? region, 
      String? ruName, 
      int? soato}){
    _city = city;
    _code = code;
    _id = id;
    _name = name;
    _region = region;
    _ruName = ruName;
    _soato = soato;
}

  Districts.fromJson(dynamic json) {
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _code = json['code'];
    _id = json['id'];
    _name = json['name'];
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _ruName = json['ru_name'];
    _soato = json['soato'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['code'] = _code;
    map['id'] = _id;
    map['name'] = _name;
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    map['ru_name'] = _ruName;
    map['soato'] = _soato;
    return map;
  }

}

/// city : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// code : 0
/// id : "string"
/// name : "string"
/// ru_name : "string"
/// soato : 0

class Region {
  City? _city;
  int? _code;
  String? _id;
  String? _name;
  String? _ruName;
  int? _soato;

  City? get city => _city;
  int? get code => _code;
  String? get id => _id;
  String? get name => _name;
  String? get ruName => _ruName;
  int? get soato => _soato;

  Region({
      City? city, 
      int? code, 
      String? id, 
      String? name, 
      String? ruName, 
      int? soato}){
    _city = city;
    _code = code;
    _id = id;
    _name = name;
    _ruName = ruName;
    _soato = soato;
}

  Region.fromJson(dynamic json) {
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _code = json['code'];
    _id = json['id'];
    _name = json['name'];
    _ruName = json['ru_name'];
    _soato = json['soato'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['code'] = _code;
    map['id'] = _id;
    map['name'] = _name;
    map['ru_name'] = _ruName;
    map['soato'] = _soato;
    return map;
  }

}

/// code : 0
/// id : "string"
/// name : "string"
/// ru_name : "string"
/// soato : 0

class City {
  int? _code;
  String? _id;
  String? _name;
  String? _ruName;
  int? _soato;

  int? get code => _code;
  String? get id => _id;
  String? get name => _name;
  String? get ruName => _ruName;
  int? get soato => _soato;

  City({
      int? code, 
      String? id, 
      String? name, 
      String? ruName, 
      int? soato}){
    _code = code;
    _id = id;
    _name = name;
    _ruName = ruName;
    _soato = soato;
}

  City.fromJson(dynamic json) {
    _code = json['code'];
    _id = json['id'];
    _name = json['name'];
    _ruName = json['ru_name'];
    _soato = json['soato'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['id'] = _id;
    map['name'] = _name;
    map['ru_name'] = _ruName;
    map['soato'] = _soato;
    return map;
  }

}

/// code : 0
/// id : "string"
/// name : "string"
/// ru_name : "string"
/// soato : 0

class CityOfVillage {
  int? _code;
  String? _id;
  String? _name;
  String? _ruName;
  int? _soato;

  int? get code => _code;
  String? get id => _id;
  String? get name => _name;
  String? get ruName => _ruName;
  int? get soato => _soato;

  CityOfVillage({
      int? code, 
      String? id, 
      String? name, 
      String? ruName, 
      int? soato}){
    _code = code;
    _id = id;
    _name = name;
    _ruName = ruName;
    _soato = soato;
}

  CityOfVillage.fromJson(dynamic json) {
    _code = json['code'];
    _id = json['id'];
    _name = json['name'];
    _ruName = json['ru_name'];
    _soato = json['soato'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['id'] = _id;
    map['name'] = _name;
    map['ru_name'] = _ruName;
    map['soato'] = _soato;
    return map;
  }

}