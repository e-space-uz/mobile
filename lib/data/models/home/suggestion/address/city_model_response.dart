import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';

/// count : 15
/// cities : [{"id":"6113805191d80c04dc0fa915","ru_name":"Андижанская область","name":"Andijon viloyati","soato":1703,"code":3},{"id":"6113805291d80c04dc0fa916","ru_name":"Бухарская область","name":"Buxoro viloyati","soato":1706,"code":6},{"id":"6113805291d80c04dc0fa917","ru_name":"Джизакская область","name":"Jizzax viloyati","soato":1708,"code":8},{"id":"6113805291d80c04dc0fa918","ru_name":"Кашкадарьинская область","name":"Qashqadaryo viloyati","soato":1710,"code":10},{"id":"6113805291d80c04dc0fa919","ru_name":"Навоийская область","name":"Navoiy viloyati","soato":1712,"code":12},{"id":"6113805291d80c04dc0fa91a","ru_name":"Наманганская область","name":"Namangan viloyati","soato":1714,"code":14},{"id":"6113805391d80c04dc0fa91b","ru_name":"Самаркандская область","name":"Samarqand viloyati","soato":1718,"code":18},{"id":"6113805391d80c04dc0fa91c","ru_name":"Сурхандарьинская область","name":"Surxandaryo viloyati","soato":1722,"code":22},{"id":"6113805391d80c04dc0fa91d","ru_name":"Сырдарьинская область","name":"Sirdaryo viloyati","soato":1724,"code":24},{"id":"6113805391d80c04dc0fa91e","ru_name":"город Ташкент","name":"Toshkent shahri","soato":1726,"code":26},{"id":"6113805491d80c04dc0fa91f","ru_name":"Ташкентская область","name":"Toshkent viloyati","soato":1727,"code":27},{"id":"6113805491d80c04dc0fa920","ru_name":"Ферганская область","name":"Farg'ona viloyati","soato":1730,"code":30},{"id":"6113805491d80c04dc0fa921","ru_name":"Хорезмская область","name":"Xorazm viloyati","soato":1733,"code":33},{"id":"6113805491d80c04dc0fa922","ru_name":"Республика Каракалпакстан","name":"Qoraqalpog'iston Respublikasi","soato":1735,"code":35},{"id":"6113805491d80c04dc0fa923","ru_name":"Узбекистон Республикаси","name":"O'zbekiston respublikasi","soato":17,"code":17}]

class CityModelResponse {
  int? _count;
  List<Cities>? _cities;

  int? get count => _count;
  List<Cities>? get cities => _cities;

  CityModelResponse({
      int? count, 
      List<Cities>? cities}){
    _count = count;
    _cities = cities;
}

  CityModelResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['cities'] != null) {
      _cities = [];
      json['cities'].forEach((v) {
        _cities?.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    if (_cities != null) {
      map['cities'] = _cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "6113805191d80c04dc0fa915"
/// ru_name : "Андижанская область"
/// name : "Andijon viloyati"
/// soato : 1703
/// code : 3

class Cities extends City {
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

  Cities({
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

  Cities.fromJson(dynamic json) {
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