
class EntityModelResponse {
  List<Entities>? _entities;
  int? _count;

  List<Entities>? get entities => _entities;
  int? get count => _count;

  EntityModelResponse({
      List<Entities>? entities, 
      int? count}){
    _entities = entities;
    _count = count;
}

  EntityModelResponse.fromJson(dynamic json) {
    if (json['entities'] != null) {
      _entities = [];
      json['entities'].forEach((v) {
        _entities?.add(Entities.fromJson(v));
      });
    }
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_entities != null) {
      map['entities'] = _entities?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// id : "6139bdb08d6b0ea55fbcfe91"
/// address : "adrres"
/// kadastr_number : "9982916191"
/// entity_number : 554204
/// entity_type_code : 1
/// city : {"id":"6113805191d80c04dc0fa915","ru_name":"Андижанская область","name":"Andijon viloyati","soato":1703,"code":3}
/// region : {"id":"611380673b56884e1ee48caf","ru_name":"Андижанский район","name":"Andijon tumani","soato":1703203,"code":203}
/// district : {"id":"611380b7611cca07ef5c1efe","ru_name":"Заврок","name":"Zavroq","soato":1703203561,"code":561}
/// status : {"id":"611f748f72e0c376da5d1f77","parent_status_id":"6103bd10dd7aa74db9a779a8","name":"Bo'sh yer uchaskasini Qurilish vazirligida","ru_name":"палата приняла заявку","description":"palata xodimi ko'rib chiqib qabul qildi","color":"#CC0905","code":"ENTITY_ACCEPTE_PALATA","type_code":1,"is_active":true}
/// created_at : "2021-09-09T07:54:24.761Z"
/// updated_at : "2021-09-10T09:25:36.265Z"

class Entities {
  String? _id;
  String? _address;
  String? _kadastrNumber;
  String? _entityNumber;
  int? _entityTypeCode;
  City? _city;
  Region? _region;
  District? _district;
  Status? _status;
  String? _createdAt;
  String? _updatedAt;
  List<EntityProperty>? entityProperties;
  int? areaOfSurface;

  String? get id => _id;
  String? get address => _address;
  String? get kadastrNumber => _kadastrNumber;
  String? get entityNumber => _entityNumber;
  int? get entityTypeCode => _entityTypeCode;
  City? get city => _city;
  Region? get region => _region;
  District? get district => _district;
  Status? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Entities({
      String? id, 
      String? address, 
      String? kadastrNumber, 
      String? entityNumber,
      int? entityTypeCode, 
      City? city, 
      Region? region, 
      District? district, 
      Status? status, 
      String? createdAt, 
      String? updatedAt,
    List<EntityProperty>? entityProperties
  }){
    _id = id;
    _address = address;
    _kadastrNumber = kadastrNumber;
    _entityNumber = entityNumber;
    _entityTypeCode = entityTypeCode;
    _city = city;
    _region = region;
    _district = district;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    entityProperties = entityProperties;
}

  Entities.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _kadastrNumber = json['kadastr_number'];
    _entityNumber = json['entity_number'];
    _entityTypeCode = json['entity_type_code'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['entity_properties'] != null) {
      entityProperties = [];
      json['entity_properties'].forEach((v) {
        entityProperties?.add(EntityProperty.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['kadastr_number'] = _kadastrNumber;
    map['entity_number'] = _entityNumber;
    map['entity_type_code'] = _entityTypeCode;
    map['entity_properties'] = entityProperties;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (entityProperties != null) {
      map['entity_properties'] = entityProperties?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "611f748f72e0c376da5d1f77"
/// parent_status_id : "6103bd10dd7aa74db9a779a8"
/// name : "Bo'sh yer uchaskasini Qurilish vazirligida"
/// ru_name : "палата приняла заявку"
/// description : "palata xodimi ko'rib chiqib qabul qildi"
/// color : "#CC0905"
/// code : "ENTITY_ACCEPTE_PALATA"
/// type_code : 1
/// is_active : true

class Status {
  String? _id;
  String? _parentStatusId;
  String? _name;
  String? _ruName;
  String? _description;
  String? _color;
  String? _code;
  int? _typeCode;
  bool? _isActive;

  String? get id => _id;
  String? get parentStatusId => _parentStatusId;
  String? get name => _name;
  String? get ruName => _ruName;
  String? get description => _description;
  String? get color => _color;
  String? get code => _code;
  int? get typeCode => _typeCode;
  bool? get isActive => _isActive;

  Status({
      String? id, 
      String? parentStatusId, 
      String? name, 
      String? ruName, 
      String? description, 
      String? color, 
      String? code, 
      int? typeCode, 
      bool? isActive}){
    _id = id;
    _parentStatusId = parentStatusId;
    _name = name;
    _ruName = ruName;
    _description = description;
    _color = color;
    _code = code;
    _typeCode = typeCode;
    _isActive = isActive;
}

  Status.fromJson(dynamic json) {
    _id = json['id'];
    _parentStatusId = json['parent_status_id'];
    _name = json['name'];
    _ruName = json['ru_name'];
    _description = json['description'];
    _color = json['color'];
    _code = json['code'];
    _typeCode = json['type_code'];
    _isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_status_id'] = _parentStatusId;
    map['name'] = _name;
    map['ru_name'] = _ruName;
    map['description'] = _description;
    map['color'] = _color;
    map['code'] = _code;
    map['type_code'] = _typeCode;
    map['is_active'] = _isActive;
    return map;
  }

}

/// id : "611380b7611cca07ef5c1efe"
/// ru_name : "Заврок"
/// name : "Zavroq"
/// soato : 1703203561
/// code : 561

class District {
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

  District({
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

  District.fromJson(dynamic json) {
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

/// id : "611380673b56884e1ee48caf"
/// ru_name : "Андижанский район"
/// name : "Andijon tumani"
/// soato : 1703203
/// code : 203

class Region {
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

  Region({
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

  Region.fromJson(dynamic json) {
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

/// id : "6113805191d80c04dc0fa915"
/// ru_name : "Андижанская область"
/// name : "Andijon viloyati"
/// soato : 1703
/// code : 3

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
class EntityProperty{
  String? propertyId;
  String? value;

  EntityProperty({this.propertyId, this.value});

  EntityProperty.fromJson(dynamic json){
    propertyId = json['property_id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['property_id'] = propertyId;
    map['value'] = value;
    return map;
  }

}