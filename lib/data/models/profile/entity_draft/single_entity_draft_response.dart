/// id : "6149a3229385af2c06443971"
/// entity_draft_soato : "1708215"
/// entity_draft_number : 996782
/// city : {"id":"6113805291d80c04dc0fa917","ru_name":"Джизакская область","name":"Jizzax viloyati","soato":1708,"code":8}
/// region : {"id":"6113806e3b56884e1ee48cd3","ru_name":"Дустликский район","name":"Do'stlik tumani","soato":1708215,"code":215}
/// district : {"id":"61402cdacc7be42ad4a05cf7","ru_name":"Мевазоp","name":"Mevazor","soato":1708215845,"code":845}
/// status : {"id":"6103887b74795f82ba173572","parent_status_id":"60ec140ba6911fb6ba8b1c98","name":"Taklif yaratildi","ru_name":"такли яратилди","description":"taklif yaratildi","color":"#EF6C00","code":"NEW_DRAFT","type_code":1,"is_active":true}
/// applicant : {"name":"KOZIMJON BAXROMJON O‘G‘LI XOLMIRZAYEV","user_id":"6138402966c656ea6f0805c0"}
/// entity_properties : [{"property":{"id":"611359b073bf6fe15aaef568","name":"Maydon","type":"string","placeholder":"Maydon","label":"Maydon","description":"Maydon","status":true,"is_required":true},"value":"Cccc"},{"property":{"id":"60ee8a5ec30b719d5f4e4686","name":"Га/Сотик","type":"string","placeholder":"Га/Сотик","label":"Га/Сотик","validation":"Га/Сотик","description":"Га/Сотик","status":true,"is_required":true},"value":"Gggg"},{"property":{"id":"60ee8a78c30b719d5f4e4687","name":"Xarita","type":"map","placeholder":"Xarita","label":"Xarita","description":"Xarita","status":true},"value":"{type: Feature, geometry: {type: Polygon, coordinates: [[[41.31145977159844, 69.23982258886099], [41.30669207737032, 69.23626530915499], [41.322604605911714, 69.19158674776554], [41.32246662286856, 69.19151499867439]]]}}"},{"property":{"id":"61262714c155e351a31692d9","name":"Qo'lda kiritilgan maydon","type":"string","placeholder":"maydonnni kiriting","label":"Qo'lda kiritilgan maydon","description":"Qo'lda kiritilgan maydon tavsif","status":true},"value":"Vvgg"}]
/// created_at : "2021-09-21T14:17:22.226+05:00"
/// updated_at : "2021-09-21T14:17:22.226+05:00"

class SingleEntityDraftResponse {
  SingleEntityDraftResponse({
      String? id, 
      String? entityDraftSoato, 
      String? entityDraftNumber,
      City? city, 
      Region? region, 
      District? district, 
      Status? status, 
      Applicant? applicant, 
      List<Entity_properties>? entityProperties, 
      String? createdAt,
      EntityInEntityDraft? entity,
      String? updatedAt,}){
    _id = id;
    _entityDraftSoato = entityDraftSoato;
    _entityDraftNumber = entityDraftNumber;
    _city = city;
    _region = region;
    _district = district;
    _status = status;
    _entity = entity;
    _applicant = applicant;
    _entityProperties = entityProperties;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  SingleEntityDraftResponse.fromJson(dynamic json) {
    _id = json['id'];
    _entityDraftSoato = json['entity_draft_soato'];
    _entityDraftNumber = json['entity_draft_number'];
    _entity = json['entity'] !=null ? EntityInEntityDraft.fromJson(json['entity']):null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _applicant = json['applicant'] != null ? Applicant.fromJson(json['applicant']) : null;
    if (json['entity_properties'] != null) {
      _entityProperties = [];
      json['entity_properties'].forEach((v) {
        _entityProperties?.add(Entity_properties.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  String? _id;
  String? _entityDraftSoato;
  String? _entityDraftNumber;
  City? _city;
  Region? _region;
  District? _district;
  Status? _status;
  Applicant? _applicant;
  List<Entity_properties>? _entityProperties;
  EntityInEntityDraft? _entity;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get entityDraftSoato => _entityDraftSoato;
  String? get entityDraftNumber => _entityDraftNumber;
  City? get city => _city;
  Region? get region => _region;
  District? get district => _district;
  Status? get status => _status;
  EntityInEntityDraft? get entity => _entity;
  Applicant? get applicant => _applicant;
  List<Entity_properties>? get entityProperties => _entityProperties;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['entity_draft_soato'] = _entityDraftSoato;
    map['entity_draft_number'] = _entityDraftNumber;
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
    if (_applicant != null) {
      map['applicant'] = _applicant?.toJson();
    }
    if (_entityProperties != null) {
      map['entity_properties'] = _entityProperties?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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


/// property : {"id":"611359b073bf6fe15aaef568","name":"Maydon","type":"string","placeholder":"Maydon","label":"Maydon","description":"Maydon","status":true,"is_required":true}
/// value : "Cccc"

class Entity_properties {
  Entity_properties({
      Property? property, 
      String? value,}){
    _property = property;
    _value = value;
}

  Entity_properties.fromJson(dynamic json) {
    _property = json['property'] != null ? Property.fromJson(json['property']) : null;
    _value = json['value'];
  }
  Property? _property;
  String? _value;

  Property? get property => _property;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_property != null) {
      map['property'] = _property?.toJson();
    }
    map['value'] = _value;
    return map;
  }

}

/// id : "611359b073bf6fe15aaef568"
/// name : "Maydon"
/// type : "string"
/// placeholder : "Maydon"
/// label : "Maydon"
/// description : "Maydon"
/// status : true
/// is_required : true

class Property {
  Property({
      String? id, 
      String? name, 
      String? type, 
      String? placeholder, 
      String? label, 
      String? description, 
      bool? status, 
      bool? isRequired,}){
    _id = id;
    _name = name;
    _type = type;
    _placeholder = placeholder;
    _label = label;
    _description = description;
    _status = status;
    _isRequired = isRequired;
}

  Property.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _placeholder = json['placeholder'];
    _label = json['label'];
    _description = json['description'];
    _status = json['status'];
    _isRequired = json['is_required'];
  }
  String? _id;
  String? _name;
  String? _type;
  String? _placeholder;
  String? _label;
  String? _description;
  bool? _status;
  bool? _isRequired;

  String? get id => _id;
  String? get name => _name;
  String? get type => _type;
  String? get placeholder => _placeholder;
  String? get label => _label;
  String? get description => _description;
  bool? get status => _status;
  bool? get isRequired => _isRequired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    map['placeholder'] = _placeholder;
    map['label'] = _label;
    map['description'] = _description;
    map['status'] = _status;
    map['is_required'] = _isRequired;
    return map;
  }

}

/// name : "KOZIMJON BAXROMJON O‘G‘LI XOLMIRZAYEV"
/// user_id : "6138402966c656ea6f0805c0"

class Applicant {
  Applicant({
      String? name, 
      String? userId,}){
    _name = name;
    _userId = userId;
}

  Applicant.fromJson(dynamic json) {
    _name = json['name'];
    _userId = json['user_id'];
  }
  String? _name;
  String? _userId;

  String? get name => _name;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['user_id'] = _userId;
    return map;
  }

}

/// id : "6103887b74795f82ba173572"
/// parent_status_id : "60ec140ba6911fb6ba8b1c98"
/// name : "Taklif yaratildi"
/// ru_name : "такли яратилди"
/// description : "taklif yaratildi"
/// color : "#EF6C00"
/// code : "NEW_DRAFT"
/// type_code : 1
/// is_active : true

class Status {
  Status({
      String? id, 
      String? parentStatusId, 
      String? name, 
      String? ruName, 
      String? description, 
      String? color, 
      String? code, 
      int? typeCode, 
      bool? isActive,}){
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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

/// id : "61402cdacc7be42ad4a05cf7"
/// ru_name : "Мевазоp"
/// name : "Mevazor"
/// soato : 1708215845
/// code : 845

class District {
  District({
      String? id, 
      String? ruName, 
      String? name, 
      int? soato, 
      int? code,}){
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ru_name'] = _ruName;
    map['name'] = _name;
    map['soato'] = _soato;
    map['code'] = _code;
    return map;
  }

}

/// id : "6113806e3b56884e1ee48cd3"
/// ru_name : "Дустликский район"
/// name : "Do'stlik tumani"
/// soato : 1708215
/// code : 215

class Region {
  Region({
      String? id, 
      String? ruName, 
      String? name, 
      int? soato, 
      int? code,}){
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ru_name'] = _ruName;
    map['name'] = _name;
    map['soato'] = _soato;
    map['code'] = _code;
    return map;
  }

}

/// id : "6113805291d80c04dc0fa917"
/// ru_name : "Джизакская область"
/// name : "Jizzax viloyati"
/// soato : 1708
/// code : 8

class City {
  City({
      String? id, 
      String? ruName, 
      String? name, 
      int? soato, 
      int? code,}){
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ru_name'] = _ruName;
    map['name'] = _name;
    map['soato'] = _soato;
    map['code'] = _code;
    return map;
  }

}