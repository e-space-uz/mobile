/// construction_types : [{"id":"6142c2146074f7fa21292a87","parent_id":"6142c2076074f7fa21292a3c","name":"9 қаватдан юқори","ru_name":"свыше 9-ти этажей","created_at":"2021-09-16T09:03:32.897+05:00","updated_at":"2021-09-16T09:03:32.897+05:00"},{"id":"6142c2146074f7fa21292a86","parent_id":"6142c2136074f7fa21292a81","name":"Сауна, турк ҳаммомлари ва бошқалар","ru_name":"сауна, турецкие бани и другие","created_at":"2021-09-16T09:03:32.702+05:00","updated_at":"2021-09-16T09:03:32.702+05:00"}]
/// count : 96

class ConstructionTypeResponse {
  ConstructionTypeResponse({
      List<ConstructionTypes>? constructionTypes,
      int? count,}){
    _constructionTypes = constructionTypes;
    _count = count;
}

  ConstructionTypeResponse.fromJson(dynamic json) {
    if (json['construction_types'] != null) {
      _constructionTypes = [];
      json['construction_types'].forEach((v) {
        _constructionTypes?.add(ConstructionTypes.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<ConstructionTypes>? _constructionTypes;
  int? _count;

  List<ConstructionTypes>? get constructionTypes => _constructionTypes;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_constructionTypes != null) {
      map['construction_types'] = _constructionTypes?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// id : "6142c2146074f7fa21292a87"
/// parent_id : "6142c2076074f7fa21292a3c"
/// name : "9 қаватдан юқори"
/// ru_name : "свыше 9-ти этажей"
/// created_at : "2021-09-16T09:03:32.897+05:00"
/// updated_at : "2021-09-16T09:03:32.897+05:00"

class ConstructionTypes {
  ConstructionTypes({
      String? id, 
      String? parentId, 
      String? name, 
      String? ruName, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _parentId = parentId;
    _name = name;
    _ruName = ruName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ConstructionTypes.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _ruName = json['ru_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _parentId;
  String? _name;
  String? _ruName;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get parentId => _parentId;
  String? get name => _name;
  String? get ruName => _ruName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['name'] = _name;
    map['ru_name'] = _ruName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}