/// statuses : [{"id":"6149a0689385af2c06443965","parent_status_id":"6103bb05dd7aa74db9a779a6","name":"Hokimiyatda","ru_name":"Hokimiyatda","description":"Hokimiyatda","color":"#0D9676","code":"ENTITY_HOKIMIYAT","type_code":2,"is_active":true}]
/// count : 62

class StatusesResponse {
  StatusesResponse({
      List<Statuses>? statuses, 
      int? count,}){
    _statuses = statuses;
    _count = count;
}

  StatusesResponse.fromJson(dynamic json) {
    if (json['statuses'] != null) {
      _statuses = [];
      json['statuses'].forEach((v) {
        _statuses?.add(Statuses.fromJson(v));
      });
    }
    _count = json['count'];
  }

  List<Statuses>? _statuses;
  int? _count;

  List<Statuses>? get statuses => _statuses;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_statuses != null) {
      map['statuses'] = _statuses?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// id : "6149a0689385af2c06443965"
/// parent_status_id : "6103bb05dd7aa74db9a779a6"
/// name : "Hokimiyatda"
/// ru_name : "Hokimiyatda"
/// description : "Hokimiyatda"
/// color : "#0D9676"
/// code : "ENTITY_HOKIMIYAT"
/// type_code : 2
/// is_active : true

class Statuses {
  Statuses({
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

  Statuses.fromJson(dynamic json) {
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