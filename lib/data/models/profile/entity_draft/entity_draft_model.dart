/// count : 0
/// entity_drafts : [{"applicant":{"name":"string","user_id":"string"},"city":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"comment":"string","created_at":"string","district":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"entity":{"entity_number":0,"id":"string"},"entity_gallery":["string"],"entity_number":0,"entity_properties":[{"property_id":"string","value":"string"}],"entity_soato":"string","id":"string","region":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"status":{"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"},"updated_at":"string"}]

class EntityDraftModel {
  int? _count;
  List<EntityDraft>? _entityDrafts;

  int? get count => _count;
  List<EntityDraft>? get entityDrafts => _entityDrafts;

  EntityDraftModel({
      int? count, 
      List<EntityDraft>? entityDrafts}){
    _count = count;
    _entityDrafts = entityDrafts;
}

  EntityDraftModel.fromJson(dynamic json) {
    _count = json['count'];
    if (json['entity_drafts'] != null) {
      _entityDrafts = [];
      json['entity_drafts'].forEach((v) {
        _entityDrafts?.add(EntityDraft.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    if (_entityDrafts != null) {
      map['entity_drafts'] = _entityDrafts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// applicant : {"name":"string","user_id":"string"}
/// city : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// comment : "string"
/// created_at : "string"
/// district : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// entity : {"entity_number":0,"id":"string"}
/// entity_gallery : ["string"]
/// entity_number : 0
/// entity_properties : [{"property_id":"string","value":"string"}]
/// entity_soato : "string"
/// id : "string"
/// region : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// status : {"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}
/// updated_at : "string"

class EntityDraft {
  Applicant? _applicant;
  City? _city;
  String? _comment;
  String? _createdAt;
  District? _district;
  EntityInEntityDraft? _entity;
  List<String>? _entityGallery;
  String? _entityNumber;
  List<Entity_properties>? _entityProperties;
  String? _entitySoato;
  String? _id;
  Region? _region;
  Status? _status;
  String? _updatedAt;

  Applicant? get applicant => _applicant;
  City? get city => _city;
  String? get comment => _comment;
  String? get createdAt => _createdAt;
  District? get district => _district;
  EntityInEntityDraft? get entity => _entity;
  List<String>? get entityGallery => _entityGallery;
  String? get entityNumber => _entityNumber;
  List<Entity_properties>? get entityProperties => _entityProperties;
  String? get entitySoato => _entitySoato;
  String? get id => _id;
  Region? get region => _region;
  Status? get status => _status;
  String? get updatedAt => _updatedAt;

  EntityDraft({
      Applicant? applicant, 
      City? city, 
      String? comment, 
      String? createdAt, 
      District? district,
      EntityInEntityDraft? entity,
      List<String>? entityGallery, 
      String? entityNumber,
      List<Entity_properties>? entityProperties, 
      String? entitySoato, 
      String? id, 
      Region? region, 
      Status? status, 
      String? updatedAt}){
    _applicant = applicant;
    _city = city;
    _comment = comment;
    _createdAt = createdAt;
    _district = district;
    _entity = entity;
    _entityGallery = entityGallery;
    _entityNumber = entityNumber;
    _entityProperties = entityProperties;
    _entitySoato = entitySoato;
    _id = id;
    _region = region;
    _status = status;
    _updatedAt = updatedAt;
}

  EntityDraft.fromJson(dynamic json) {
    _applicant = json['applicant'] != null ? Applicant.fromJson(json['applicant']) : null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _comment = json['comment'];
    _createdAt = json['created_at'];
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    _entity = json['entity'] != null ? EntityInEntityDraft.fromJson(json['entity']) : null;
    _entityGallery = json['entity_gallery'] != null ? json['entity_gallery'].cast<String>() : [];
    _entityNumber = json['entity_draft_number'];
    if (json['entity_properties'] != null) {
      _entityProperties = [];
      json['entity_properties'].forEach((v) {
        _entityProperties?.add(Entity_properties.fromJson(v));
      });
    }
    _entitySoato = json['entity_draft_soato'];
    _id = json['id'];
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_applicant != null) {
      map['applicant'] = _applicant?.toJson();
    }
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['comment'] = _comment;
    map['created_at'] = _createdAt;
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    if (_entity != null) {
      map['entity'] = _entity?.toJson();
    }
    map['entity_gallery'] = _entityGallery;
    map['entity_draft_number'] = _entityNumber;
    if (_entityProperties != null) {
      map['entity_properties'] = _entityProperties?.map((v) => v.toJson()).toList();
    }
    map['entity_soato'] = _entitySoato;
    map['id'] = _id;
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// code : "string"
/// color : "string"
/// created_at : "string"
/// description : "string"
/// id : "string"
/// is_active : true
/// name : "string"
/// parent_status_id : "string"
/// ru_name : "string"
/// type_code : 0
/// updated_at : "string"

class Status {
  String? _code;
  String? _color;
  String? _createdAt;
  String? _description;
  String? _id;
  bool? _isActive;
  String? _name;
  String? _parentStatusId;
  String? _ruName;
  int? _typeCode;
  String? _updatedAt;

  String? get code => _code;
  String? get color => _color;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  bool? get isActive => _isActive;
  String? get name => _name;
  String? get parentStatusId => _parentStatusId;
  String? get ruName => _ruName;
  int? get typeCode => _typeCode;
  String? get updatedAt => _updatedAt;

  Status({
      String? code, 
      String? color, 
      String? createdAt, 
      String? description, 
      String? id, 
      bool? isActive, 
      String? name, 
      String? parentStatusId, 
      String? ruName, 
      int? typeCode, 
      String? updatedAt}){
    _code = code;
    _color = color;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _isActive = isActive;
    _name = name;
    _parentStatusId = parentStatusId;
    _ruName = ruName;
    _typeCode = typeCode;
    _updatedAt = updatedAt;
}

  Status.fromJson(dynamic json) {
    _code = json['code'];
    _color = json['color'];
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _isActive = json['is_active'];
    _name = json['name'];
    _parentStatusId = json['parent_status_id'];
    _ruName = json['ru_name'];
    _typeCode = json['type_code'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['color'] = _color;
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['is_active'] = _isActive;
    map['name'] = _name;
    map['parent_status_id'] = _parentStatusId;
    map['ru_name'] = _ruName;
    map['type_code'] = _typeCode;
    map['updated_at'] = _updatedAt;
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

class Entity_properties {
  String? _propertyId;
  String? _value;

  String? get propertyId => _propertyId;
  String? get value => _value;

  Entity_properties({
      String? propertyId, 
      String? value}){
    _propertyId = propertyId;
    _value = value;
}

  Entity_properties.fromJson(dynamic json) {
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

class EntityInEntityDraft {
  EntityInEntityDraft({
    String? id,
    String? address,
    String? entityNumber,
    int? entityTypeCode,
    City? city,
    Region? region,
    District? district,}){
    _id = id;
    _address = address;
    _entityNumber = entityNumber;
    _entityTypeCode = entityTypeCode;
    _city = city;
    _region = region;
    _district = district;
  }

  EntityInEntityDraft.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _entityNumber = json['entity_number'];
    _entityTypeCode = json['entity_type_code'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
  }
  String? _id;
  String? _address;
  String? _entityNumber;
  int? _entityTypeCode;
  City? _city;
  Region? _region;
  District? _district;

  String? get id => _id;
  String? get address => _address;
  String? get entityNumber => _entityNumber;
  int? get entityTypeCode => _entityTypeCode;
  City? get city => _city;
  Region? get region => _region;
  District? get district => _district;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['entity_number'] = _entityNumber;
    map['entity_type_code'] = _entityTypeCode;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
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

/// name : "string"
/// user_id : "string"

class Applicant {
  String? _name;
  String? _userId;

  String? get name => _name;
  String? get userId => _userId;

  Applicant({
      String? name, 
      String? userId}){
    _name = name;
    _userId = userId;
}

  Applicant.fromJson(dynamic json) {
    _name = json['name'];
    _userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['user_id'] = _userId;
    return map;
  }
}