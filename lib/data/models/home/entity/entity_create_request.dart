
class EntityCreateRequest {
  City? _city;
  String? _comment;
  District? _district;
  List<String>? _entityGallery;
  String? _entityId;
  List<EntityPropertyModel>? _entityProperties;
  Region? _region;

  City? get city => _city;
  String? get comment => _comment;
  District? get district => _district;
  List<String>? get entityGallery => _entityGallery;
  String? get entityId => _entityId;
  List<EntityPropertyModel>? get entityProperties => _entityProperties;
  Region? get region => _region;

  EntityCreateRequest({
      City? city, 
      String? comment, 
      District? district, 
      List<String>? entityGallery, 
      String? entityId, 
      List<EntityPropertyModel>? entityProperties, 
      Region? region}){
    _city = city;
    _comment = comment;
    _district = district;
    _entityGallery = entityGallery;
    _entityId = entityId;
    _entityProperties = entityProperties;
    _region = region;
}

  EntityCreateRequest.fromJson(dynamic json) {
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _comment = json['comment'];
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    _entityGallery = json['entity_gallery'] != null ? json['entity_gallery'].cast<String>() : [];
    _entityId = json['entity_id'];
    if (json['entity_properties'] != null) {
      _entityProperties = [];
      json['entity_properties'].forEach((v) {
        _entityProperties?.add(EntityPropertyModel.fromJson(v));
      });
    }
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['comment'] = _comment;
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    map['entity_gallery'] = _entityGallery;
    if (_entityProperties != null) {
      map['entity_properties'] = _entityProperties?.map((v) => v.toJson()).toList();
    }
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    return map;
  }

}

/// code : 0
/// id : "string"
/// name : "string"
/// ru_name : "string"
/// soato : 0

class Region {
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

  Region({
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

  Region.fromJson(dynamic json) {
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

/// property_id : "string"
/// value : "string"

class EntityPropertyModel {
  String? _propertyId;
  String? _value;

  String? get propertyId => _propertyId;
  String? get value => _value;

  EntityPropertyModel({
      String? propertyId, 
      String? value}){
    _propertyId = propertyId;
    _value = value;
}

  EntityPropertyModel.fromJson(dynamic json) {
    _propertyId = json['property_id'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['property_id'] = _propertyId;
    map['value'] = _value;
    return map;
  }

}

/// code : 0
/// id : "string"
/// name : "string"
/// ru_name : "string"
/// soato : 0

class District {
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

  District({
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

  District.fromJson(dynamic json) {
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

class City  {
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