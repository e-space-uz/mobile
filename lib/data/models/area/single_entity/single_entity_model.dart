/// address : "string"
/// city : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// created_at : "string"
/// district : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// entity_drafts : [{"applicant":{"name":"string","user_id":"string"},"city":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"comment":"string","created_at":"string","district":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"entity_number":0,"entity_soato":"string","id":"string","region":{"code":0,"id":"string","name":"string","ru_name":"string","soato":0},"status":{"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"},"updated_at":"string"}]
/// entity_files : [{"comment":"string","file_name":"string","id":"string","url":"string","user":"string"}]
/// entity_gallery : ["string"]
/// entity_number : 0
/// entity_properties : [{"property":{"description":"string","id":"string","is_required":true,"label":"string","name":"string","placeholder":"string","property_options":[{"name":"string","value":"string"}],"status":true,"type":"string","validation":"string","with_confirmation":true},"value":"string"}]
/// entity_soato : "string"
/// entity_status_update : "string"
/// entity_type_code : 0
/// id : "string"
/// kadastr_number : "string"
/// region : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// registration_date : "string"
/// status : {"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}
/// updated_at : "string"

class SingleEntityModel {
  String? _address;
  City? _city;
  String? _createdAt;
  District? _district;
  List<Entity_drafts>? _entityDrafts;
  List<Entity_files>? _entityFiles;
  List<String>? _entityGallery;
  String? _entityNumber;
  List<Entity_properties>? _entityProperties;
  String? _entitySoato;
  String? _entityStatusUpdate;
  int? _entityTypeCode;
  String? _id;
  String? _kadastrNumber;
  Region? _region;
  String? _registrationDate;
  Status? _status;
  String? _updatedAt;

  String? get address => _address;
  City? get city => _city;
  String? get createdAt => _createdAt;
  District? get district => _district;
  List<Entity_drafts>? get entityDrafts => _entityDrafts;
  List<Entity_files>? get entityFiles => _entityFiles;
  List<String>? get entityGallery => _entityGallery;
  String? get entityNumber => _entityNumber;
  List<Entity_properties>? get entityProperties => _entityProperties;
  String? get entitySoato => _entitySoato;
  String? get entityStatusUpdate => _entityStatusUpdate;
  int? get entityTypeCode => _entityTypeCode;
  String? get id => _id;
  String? get kadastrNumber => _kadastrNumber;
  Region? get region => _region;
  String? get registrationDate => _registrationDate;
  Status? get status => _status;
  String? get updatedAt => _updatedAt;

  SingleEntityModel({
      String? address, 
      City? city, 
      String? createdAt, 
      District? district, 
      List<Entity_drafts>? entityDrafts, 
      List<Entity_files>? entityFiles, 
      List<String>? entityGallery, 
      String? entityNumber,
      List<Entity_properties>? entityProperties, 
      String? entitySoato, 
      String? entityStatusUpdate, 
      int? entityTypeCode, 
      String? id, 
      String? kadastrNumber, 
      Region? region, 
      String? registrationDate, 
      Status? status, 
      String? updatedAt}){
    _address = address;
    _city = city;
    _createdAt = createdAt;
    _district = district;
    _entityDrafts = entityDrafts;
    _entityFiles = entityFiles;
    _entityGallery = entityGallery;
    _entityNumber = entityNumber;
    _entityProperties = entityProperties;
    _entitySoato = entitySoato;
    _entityStatusUpdate = entityStatusUpdate;
    _entityTypeCode = entityTypeCode;
    _id = id;
    _kadastrNumber = kadastrNumber;
    _region = region;
    _registrationDate = registrationDate;
    _status = status;
    _updatedAt = updatedAt;
}

  SingleEntityModel.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _createdAt = json['created_at'];
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    if (json['entity_drafts'] != null) {
      _entityDrafts = [];
      json['entity_drafts'].forEach((v) {
        _entityDrafts?.add(Entity_drafts.fromJson(v));
      });
    }
    if (json['entity_files'] != null) {
      _entityFiles = [];
      json['entity_files'].forEach((v) {
        _entityFiles?.add(Entity_files.fromJson(v));
      });
    }
    _entityGallery = json['entity_gallery'] != null ? json['entity_gallery'].cast<String>() : [];
    _entityNumber = json['entity_number'];
    if (json['entity_properties'] != null) {
      _entityProperties = [];
      json['entity_properties'].forEach((v) {
        _entityProperties?.add(Entity_properties.fromJson(v));
      });
    }
    _entitySoato = json['entity_soato'];
    _entityStatusUpdate = json['entity_status_update'];
    _entityTypeCode = json['entity_type_code'];
    _id = json['id'];
    _kadastrNumber = json['kadastr_number'];
    _region = json['region'] != null ? Region.fromJson(json['region']) : null;
    _registrationDate = json['registration_date'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['address'] = _address;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['created_at'] = _createdAt;
    if (_district != null) {
      map['district'] = _district?.toJson();
    }
    if (_entityDrafts != null) {
      map['entity_drafts'] = _entityDrafts?.map((v) => v.toJson()).toList();
    }
    if (_entityFiles != null) {
      map['entity_files'] = _entityFiles?.map((v) => v.toJson()).toList();
    }
    map['entity_gallery'] = _entityGallery;
    map['entity_number'] = _entityNumber;
    if (_entityProperties != null) {
      map['entity_properties'] = _entityProperties?.map((v) => v.toJson()).toList();
    }
    map['entity_soato'] = _entitySoato;
    map['entity_status_update'] = _entityStatusUpdate;
    map['entity_type_code'] = _entityTypeCode;
    map['id'] = _id;
    map['kadastr_number'] = _kadastrNumber;
    if (_region != null) {
      map['region'] = _region?.toJson();
    }
    map['registration_date'] = _registrationDate;
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

/// property : {"description":"string","id":"string","is_required":true,"label":"string","name":"string","placeholder":"string","property_options":[{"name":"string","value":"string"}],"status":true,"type":"string","validation":"string","with_confirmation":true}
/// value : "string"

class Entity_properties {
  Property? _property;
  String? _value;

  Property? get property => _property;
  String? get value => _value;

  Entity_properties({
      Property? property, 
      String? value}){
    _property = property;
    _value = value;
}

  Entity_properties.fromJson(dynamic json) {
    _property = json['property'] != null ? Property.fromJson(json['property']) : null;
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_property != null) {
      map['property'] = _property?.toJson();
    }
    map['value'] = _value;
    return map;
  }

}

/// description : "string"
/// id : "string"
/// is_required : true
/// label : "string"
/// name : "string"
/// placeholder : "string"
/// property_options : [{"name":"string","value":"string"}]
/// status : true
/// type : "string"
/// validation : "string"
/// with_confirmation : true

class Property {
  String? _description;
  String? _id;
  bool? _isRequired;
  String? _label;
  String? _name;
  String? _placeholder;
  List<Property_options>? _propertyOptions;
  bool? _status;
  String? _type;
  String? _validation;
  bool? _withConfirmation;

  String? get description => _description;
  String? get id => _id;
  bool? get isRequired => _isRequired;
  String? get label => _label;
  String? get name => _name;
  String? get placeholder => _placeholder;
  List<Property_options>? get propertyOptions => _propertyOptions;
  bool? get status => _status;
  String? get type => _type;
  String? get validation => _validation;
  bool? get withConfirmation => _withConfirmation;

  Property({
      String? description, 
      String? id, 
      bool? isRequired, 
      String? label, 
      String? name, 
      String? placeholder, 
      List<Property_options>? propertyOptions, 
      bool? status, 
      String? type, 
      String? validation, 
      bool? withConfirmation}){
    _description = description;
    _id = id;
    _isRequired = isRequired;
    _label = label;
    _name = name;
    _placeholder = placeholder;
    _propertyOptions = propertyOptions;
    _status = status;
    _type = type;
    _validation = validation;
    _withConfirmation = withConfirmation;
}

  Property.fromJson(dynamic json) {
    _description = json['description'];
    _id = json['id'];
    _isRequired = json['is_required'];
    _label = json['label'];
    _name = json['name'];
    _placeholder = json['placeholder'];
    if (json['property_options'] != null) {
      _propertyOptions = [];
      json['property_options'].forEach((v) {
        _propertyOptions?.add(Property_options.fromJson(v));
      });
    }
    _status = json['status'];
    _type = json['type'];
    _validation = json['validation'];
    _withConfirmation = json['with_confirmation'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['description'] = _description;
    map['id'] = _id;
    map['is_required'] = _isRequired;
    map['label'] = _label;
    map['name'] = _name;
    map['placeholder'] = _placeholder;
    if (_propertyOptions != null) {
      map['property_options'] = _propertyOptions?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['type'] = _type;
    map['validation'] = _validation;
    map['with_confirmation'] = _withConfirmation;
    return map;
  }

}

/// name : "string"
/// value : "string"

class Property_options {
  String? _name;
  String? _value;

  String? get name => _name;
  String? get value => _value;

  Property_options({
      String? name, 
      String? value}){
    _name = name;
    _value = value;
}

  Property_options.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }

}

/// comment : "string"
/// file_name : "string"
/// id : "string"
/// url : "string"
/// user : "string"

class Entity_files {
  String? _comment;
  String? _fileName;
  String? _id;
  String? _url;
  String? _user;

  String? get comment => _comment;
  String? get fileName => _fileName;
  String? get id => _id;
  String? get url => _url;
  String? get user => _user;

  Entity_files({
      String? comment, 
      String? fileName, 
      String? id, 
      String? url, 
      String? user}){
    _comment = comment;
    _fileName = fileName;
    _id = id;
    _url = url;
    _user = user;
}

  Entity_files.fromJson(dynamic json) {
    _comment = json['comment'];
    _fileName = json['file_name'];
    _id = json['id'];
    _url = json['url'];
    _user = json['user'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['comment'] = _comment;
    map['file_name'] = _fileName;
    map['id'] = _id;
    map['url'] = _url;
    map['user'] = _user;
    return map;
  }

}

/// applicant : {"name":"string","user_id":"string"}
/// city : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// comment : "string"
/// created_at : "string"
/// district : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// entity_number : 0
/// entity_soato : "string"
/// id : "string"
/// region : {"code":0,"id":"string","name":"string","ru_name":"string","soato":0}
/// status : {"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}
/// updated_at : "string"

class Entity_drafts {
  Applicant? _applicant;
  City? _city;
  String? _comment;
  String? _createdAt;
  District? _district;
  int? _entityNumber;
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
  int? get entityNumber => _entityNumber;
  String? get entitySoato => _entitySoato;
  String? get id => _id;
  Region? get region => _region;
  Status? get status => _status;
  String? get updatedAt => _updatedAt;

  Entity_drafts({
      Applicant? applicant, 
      City? city, 
      String? comment, 
      String? createdAt, 
      District? district, 
      int? entityNumber, 
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
    _entityNumber = entityNumber;
    _entitySoato = entitySoato;
    _id = id;
    _region = region;
    _status = status;
    _updatedAt = updatedAt;
}

  Entity_drafts.fromJson(dynamic json) {
    _applicant = json['applicant'] != null ? Applicant.fromJson(json['applicant']) : null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _comment = json['comment'];
    _createdAt = json['created_at'];
    _district = json['district'] != null ? District.fromJson(json['district']) : null;
    _entityNumber = json['entity_number'];
    _entitySoato = json['entity_soato'];
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
    map['entity_number'] = _entityNumber;
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

class StatusData {
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

  StatusData({
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

  StatusData.fromJson(dynamic json) {
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

class RegionModel {
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

  RegionModel({
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

  RegionModel.fromJson(dynamic json) {
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

/// code : 0
/// id : "string"
/// name : "string"
/// ru_name : "string"
/// soato : 0

class DistrictModel {
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

  DistrictModel({
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

  DistrictModel.fromJson(dynamic json) {
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

class CityModel {
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

  CityModel.fromJson(dynamic json) {
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