
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

/// count : 0
/// group_properties : [{"category":0,"description":"string","id":"string","name":"string","properties":[{"description":"string","id":"string","is_required":true,"label":"string","name":"string","placeholder":"string","property_options":[{"name":"string","value":"string"}],"status":true,"type":"string","validation":"string","with_confirmation":true}],"read_statuses":[{"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}],"status":true,"step":0,"type":0,"write_statuses":[{"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}]}]

class StepsModelResponse {
  int? _count;
  List<GroupProperties>? _groupProperties;

  int? get count => _count;
  List<GroupProperties>? get groupProperties => _groupProperties;

  StepsModelResponse({
      int? count, 
      List<GroupProperties>? groupProperties}){
    _count = count;
    _groupProperties = groupProperties;
}

  StepsModelResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['group_properties'] != null) {
      _groupProperties = [];
      json['group_properties'].forEach((v) {
        _groupProperties?.add(GroupProperties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    if (_groupProperties != null) {
      map['group_properties'] = _groupProperties?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// category : 0
/// description : "string"
/// id : "string"
/// name : "string"
/// properties : [{"description":"string","id":"string","is_required":true,"label":"string","name":"string","placeholder":"string","property_options":[{"name":"string","value":"string"}],"status":true,"type":"string","validation":"string","with_confirmation":true}]
/// read_statuses : [{"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}]
/// status : true
/// step : 0
/// type : 0
/// write_statuses : [{"code":"string","color":"string","created_at":"string","description":"string","id":"string","is_active":true,"name":"string","parent_status_id":"string","ru_name":"string","type_code":0,"updated_at":"string"}]

class GroupProperties {
  int? _category;
  String? _description;
  String? _id;
  String? _name;
  List<Properties>? _properties;
  List<ReadStatuses>? _readStatuses;
  bool? _status;
  int? _step;
  int? _type;
  List<WriteStatuses>? _writeStatuses;

  int? get category => _category;
  String? get description => _description;
  String? get id => _id;
  String? get name => _name;
  List<Properties>? get properties => _properties;
  List<ReadStatuses>? get readStatuses => _readStatuses;
  bool? get status => _status;
  int? get step => _step;
  int? get type => _type;
  List<WriteStatuses>? get writeStatuses => _writeStatuses;

  GroupProperties({
      int? category, 
      String? description, 
      String? id, 
      String? name, 
      List<Properties>? properties, 
      List<ReadStatuses>? readStatuses,
      bool? status, 
      int? step, 
      int? type, 
      List<WriteStatuses>? writeStatuses}){
    _category = category;
    _description = description;
    _id = id;
    _name = name;
    _properties = properties;
    _readStatuses = readStatuses;
    _status = status;
    _step = step;
    _type = type;
    _writeStatuses = writeStatuses;
}

  GroupProperties.fromJson(dynamic json) {
    _category = json['category'];
    _description = json['description'];
    _id = json['id'];
    _name = json['name'];
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    if (json['read_statuses'] != null) {
      _readStatuses = [];
      json['read_statuses'].forEach((v) {
        _readStatuses?.add(ReadStatuses.fromJson(v));
      });
    }
    _status = json['status'];
    _step = json['step'];
    _type = json['type'];
    if (json['write_statuses'] != null) {
      _writeStatuses = [];
      json['write_statuses'].forEach((v) {
        _writeStatuses?.add(WriteStatuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['category'] = _category;
    map['description'] = _description;
    map['id'] = _id;
    map['name'] = _name;
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_readStatuses != null) {
      map['read_statuses'] = _readStatuses?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['step'] = _step;
    map['type'] = _type;
    if (_writeStatuses != null) {
      map['write_statuses'] = _writeStatuses?.map((v) => v.toJson()).toList();
    }
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

class WriteStatuses {
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

  WriteStatuses({
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

  WriteStatuses.fromJson(dynamic json) {
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

class ReadStatuses {
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

  ReadStatuses({
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

  ReadStatuses.fromJson(dynamic json) {
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

class Properties {
  String? _description;
  String? _id;
  bool? _isRequired;
  String? _label;
  String? _name;
  String? _placeholder;
  List<PropertyOptions>? _propertyOptions;
  bool? _status;
  String? _type;
  String? _validation;
  bool? _withConfirmation;

  //// for answer purpose;
  String? input;
  String? inputNumber;
  String? textArea;
  bool? switchType;
  String? date;
  String? fileUrl;
  String? fileName;
  String? radio;
  bool isRequiredDone = false;
  List<String> checkBox=[];
  String? map;
  List<LatLng> pointMapList = [];


  String? get description => _description;
  String? get id => _id;
  bool? get isRequired => _isRequired;
  String? get label => _label;
  String? get name => _name;
  String? get placeholder => _placeholder;
  List<PropertyOptions>? get propertyOptions => _propertyOptions;
  bool? get status => _status;
  String? get type => _type;
  String? get validation => _validation;
  bool? get withConfirmation => _withConfirmation;

  Properties({
      String? description, 
      String? id, 
      bool? isRequired, 
      String? label, 
      String? name, 
      String? placeholder, 
      List<PropertyOptions>? propertyOptions,
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

  Properties.fromJson(dynamic json) {
    _description = json['description'];
    _id = json['id'];
    _isRequired = json['is_required'];
    _label = json['label'];
    _name = json['name'];
    _placeholder = json['placeholder'];
    if (json['property_options'] != null) {
      _propertyOptions = [];
      json['property_options'].forEach((v) {
        _propertyOptions?.add(PropertyOptions.fromJson(v));
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

class PropertyOptions {
  String? _name;
  String? _value;

  String? get name => _name;
  String? get value => _value;

  PropertyOptions({
      String? name, 
      String? value}){
    _name = name;
    _value = value;
}

  PropertyOptions.fromJson(dynamic json) {
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