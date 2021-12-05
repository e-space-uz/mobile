/// action_histories : [{"id":"6154358257caa0d0702c852b","user_id":"61136c9573bf6fe15aaef56d","action":"Ariza keyingi qadamga o'tkazildi","entity_id":"6154356657caa0d0702c8527","entity_name":"entity","user":{"id":"61136c9573bf6fe15aaef56d","unique_name":"12345-17-000","first_name":"Zafar","last_name":"Khamidullaev","middle_name":"Khayrullayevich","phone_number":"+998998414636","user_type":"staff","address":"Taqachi 48","passport_number":"AA1234567","passport_issue_date":"2016-07-12T00:00:00Z","passport_issue_place":"Uchtepa Tuman IIB","email":"khamidullaevzafar@gmail.com","login":"khamidullaev","password":"$argon2id$v=19$models=65536,t=3,p=4$/78EgcP5wAuqH6XY5hWPRw$fn/qpyt5huGsZVe/M+o5Dj16a6UKHrcA16R2vdddRoY","soato":"17","pinfl":"1234567","inn":1234567,"policy":1,"organization":{"id":"61160bd06981509d88ee5721","name":"Qurilish vazirligitest","full_name":"Uzbekiston Respublikasi Qurilish vazirligi ","description":"Uzbekiston Respublikasi Qurilish vazirligi  ","status":true,"code":12,"created_at":"2021-08-13T06:06:08.429Z","updated_at":"2021-09-29T08:53:27.097Z"},"created_at":"2021-08-11T06:22:13.397Z","updated_at":"2021-08-11T06:22:13.397Z","verified":true},"created_at":"2021-09-29T09:44:34.641Z"},{"id":"6154356657caa0d0702c8528","user_id":"6138814666c656ea6f0805d3","action":"Ariza yaratildi","entity_id":"6154356657caa0d0702c8527","entity_name":"entity","user":{"id":"6138814666c656ea6f0805d3","unique_name":"1-1726-001","first_name":"kadastrName","last_name":"kadastrLastname","middle_name":"kadastrSecondname","phone_number":"+998 99 111 11 12","user_type":"staff","address":"Узбекистан, Ташкент, проспект Мустакиллик, 5, ","passport_number":"235234423","passport_issue_date":"1999-02-23T00:00:00Z","passport_issue_place":"Udevs gulzor","email":"kadastr","login":"kadastr","password":"$argon2id$v=19$models=65536,t=3,p=4$HMPi6oacQZXi6XzK8w+MEw$mOb2jVxJnkyopgFsQG0FKCpZw8AtKf0VIF3cB5NVemA","soato":"1703","pinfl":"234244","inn":324234,"policy":1,"organization":{"id":"6114f64972d8040763ef1b58","name":"Kadastr agentligi","full_name":"O‘ZBEKISTON RESPUBLIKASI DAVLAT SOLIQ QO‘MITASI HUZURIDAGI KADASTR AGENTLIGI","description":"O‘ZBEKISTON RESPUBLIKASI DAVLAT SOLIQ QO‘MITASI HUZURIDAGI KADASTR AGENTLIGI ","status":true,"code":1,"created_at":"2021-08-12T10:22:01.012Z","updated_at":"2021-08-19T05:47:20.254Z"},"city":{"id":"6113805191d80c04dc0fa915","ru_name":"Андижанская область","name":"Andijon viloyati","code":3},"created_at":"2021-09-08T09:24:22.013Z","updated_at":"2021-09-15T10:32:08.032Z","verified":true},"created_at":"2021-09-29T09:44:06.246Z"}]

class EntityActionHistory {
  EntityActionHistory({
      List<ActionHistories>? actionHistories,}){
    _actionHistories = actionHistories;
}

  EntityActionHistory.fromJson(dynamic json) {
    if (json['action_histories'] != null) {
      _actionHistories = [];
      json['action_histories'].forEach((v) {
        _actionHistories?.add(ActionHistories.fromJson(v));
      });
    }
  }
  List<ActionHistories>? _actionHistories;

  List<ActionHistories>? get actionHistories => _actionHistories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_actionHistories != null) {
      map['action_histories'] = _actionHistories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "6154358257caa0d0702c852b"
/// user_id : "61136c9573bf6fe15aaef56d"
/// action : "Ariza keyingi qadamga o'tkazildi"
/// entity_id : "6154356657caa0d0702c8527"
/// entity_name : "entity"
/// user : {"id":"61136c9573bf6fe15aaef56d","unique_name":"12345-17-000","first_name":"Zafar","last_name":"Khamidullaev","middle_name":"Khayrullayevich","phone_number":"+998998414636","user_type":"staff","address":"Taqachi 48","passport_number":"AA1234567","passport_issue_date":"2016-07-12T00:00:00Z","passport_issue_place":"Uchtepa Tuman IIB","email":"khamidullaevzafar@gmail.com","login":"khamidullaev","password":"$argon2id$v=19$models=65536,t=3,p=4$/78EgcP5wAuqH6XY5hWPRw$fn/qpyt5huGsZVe/M+o5Dj16a6UKHrcA16R2vdddRoY","soato":"17","pinfl":"1234567","inn":1234567,"policy":1,"organization":{"id":"61160bd06981509d88ee5721","name":"Qurilish vazirligitest","full_name":"Uzbekiston Respublikasi Qurilish vazirligi ","description":"Uzbekiston Respublikasi Qurilish vazirligi  ","status":true,"code":12,"created_at":"2021-08-13T06:06:08.429Z","updated_at":"2021-09-29T08:53:27.097Z"},"created_at":"2021-08-11T06:22:13.397Z","updated_at":"2021-08-11T06:22:13.397Z","verified":true}
/// created_at : "2021-09-29T09:44:34.641Z"

class ActionHistories {
  ActionHistories({
      String? id, 
      String? userId, 
      String? action, 
      String? entityId, 
      String? entityName, 
      User? user, 
      String? createdAt,}){
    _id = id;
    _userId = userId;
    _action = action;
    _entityId = entityId;
    _entityName = entityName;
    _user = user;
    _createdAt = createdAt;
}

  ActionHistories.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _action = json['action'];
    _entityId = json['entity_id'];
    _entityName = json['entity_name'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _userId;
  String? _action;
  String? _entityId;
  String? _entityName;
  User? _user;
  String? _createdAt;

  String? get id => _id;
  String? get userId => _userId;
  String? get action => _action;
  String? get entityId => _entityId;
  String? get entityName => _entityName;
  User? get user => _user;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['action'] = _action;
    map['entity_id'] = _entityId;
    map['entity_name'] = _entityName;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['created_at'] = _createdAt;
    return map;
  }

}

/// id : "61136c9573bf6fe15aaef56d"
/// unique_name : "12345-17-000"
/// first_name : "Zafar"
/// last_name : "Khamidullaev"
/// middle_name : "Khayrullayevich"
/// phone_number : "+998998414636"
/// user_type : "staff"
/// address : "Taqachi 48"
/// passport_number : "AA1234567"
/// passport_issue_date : "2016-07-12T00:00:00Z"
/// passport_issue_place : "Uchtepa Tuman IIB"
/// email : "khamidullaevzafar@gmail.com"
/// login : "khamidullaev"
/// password : "$argon2id$v=19$models=65536,t=3,p=4$/78EgcP5wAuqH6XY5hWPRw$fn/qpyt5huGsZVe/M+o5Dj16a6UKHrcA16R2vdddRoY"
/// soato : "17"
/// pinfl : "1234567"
/// inn : 1234567
/// policy : 1
/// organization : {"id":"61160bd06981509d88ee5721","name":"Qurilish vazirligitest","full_name":"Uzbekiston Respublikasi Qurilish vazirligi ","description":"Uzbekiston Respublikasi Qurilish vazirligi  ","status":true,"code":12,"created_at":"2021-08-13T06:06:08.429Z","updated_at":"2021-09-29T08:53:27.097Z"}
/// created_at : "2021-08-11T06:22:13.397Z"
/// updated_at : "2021-08-11T06:22:13.397Z"
/// verified : true

class User {
  User({
      String? id, 
      String? uniqueName, 
      String? firstName, 
      String? lastName, 
      String? middleName, 
      String? phoneNumber, 
      String? userType, 
      String? address, 
      String? passportNumber, 
      String? passportIssueDate, 
      String? passportIssuePlace, 
      String? email, 
      String? login, 
      String? password, 
      String? soato, 
      String? pinfl, 
      int? inn, 
      int? policy, 
      Organization? organization, 
      String? createdAt, 
      String? updatedAt, 
      bool? verified,}){
    _id = id;
    _uniqueName = uniqueName;
    _firstName = firstName;
    _lastName = lastName;
    _middleName = middleName;
    _phoneNumber = phoneNumber;
    _userType = userType;
    _address = address;
    _passportNumber = passportNumber;
    _passportIssueDate = passportIssueDate;
    _passportIssuePlace = passportIssuePlace;
    _email = email;
    _login = login;
    _password = password;
    _soato = soato;
    _pinfl = pinfl;
    _inn = inn;
    _policy = policy;
    _organization = organization;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _verified = verified;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _uniqueName = json['unique_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _middleName = json['middle_name'];
    _phoneNumber = json['phone_number'];
    _userType = json['user_type'];
    _address = json['address'];
    _passportNumber = json['passport_number'];
    _passportIssueDate = json['passport_issue_date'];
    _passportIssuePlace = json['passport_issue_place'];
    _email = json['email'];
    _login = json['login'];
    _password = json['password'];
    _soato = json['soato'];
    _pinfl = json['pinfl'];
    _inn = json['inn'];
    _policy = json['policy'];
    _organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _verified = json['verified'];
  }
  String? _id;
  String? _uniqueName;
  String? _firstName;
  String? _lastName;
  String? _middleName;
  String? _phoneNumber;
  String? _userType;
  String? _address;
  String? _passportNumber;
  String? _passportIssueDate;
  String? _passportIssuePlace;
  String? _email;
  String? _login;
  String? _password;
  String? _soato;
  String? _pinfl;
  int? _inn;
  int? _policy;
  Organization? _organization;
  String? _createdAt;
  String? _updatedAt;
  bool? _verified;

  String? get id => _id;
  String? get uniqueName => _uniqueName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get middleName => _middleName;
  String? get phoneNumber => _phoneNumber;
  String? get userType => _userType;
  String? get address => _address;
  String? get passportNumber => _passportNumber;
  String? get passportIssueDate => _passportIssueDate;
  String? get passportIssuePlace => _passportIssuePlace;
  String? get email => _email;
  String? get login => _login;
  String? get password => _password;
  String? get soato => _soato;
  String? get pinfl => _pinfl;
  int? get inn => _inn;
  int? get policy => _policy;
  Organization? get organization => _organization;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  bool? get verified => _verified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['unique_name'] = _uniqueName;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['middle_name'] = _middleName;
    map['phone_number'] = _phoneNumber;
    map['user_type'] = _userType;
    map['address'] = _address;
    map['passport_number'] = _passportNumber;
    map['passport_issue_date'] = _passportIssueDate;
    map['passport_issue_place'] = _passportIssuePlace;
    map['email'] = _email;
    map['login'] = _login;
    map['password'] = _password;
    map['soato'] = _soato;
    map['pinfl'] = _pinfl;
    map['inn'] = _inn;
    map['policy'] = _policy;
    if (_organization != null) {
      map['organization'] = _organization?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['verified'] = _verified;
    return map;
  }

}

/// id : "61160bd06981509d88ee5721"
/// name : "Qurilish vazirligitest"
/// full_name : "Uzbekiston Respublikasi Qurilish vazirligi "
/// description : "Uzbekiston Respublikasi Qurilish vazirligi  "
/// status : true
/// code : 12
/// created_at : "2021-08-13T06:06:08.429Z"
/// updated_at : "2021-09-29T08:53:27.097Z"

class Organization {
  Organization({
      String? id, 
      String? name, 
      String? fullName, 
      String? description, 
      bool? status, 
      int? code, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _fullName = fullName;
    _description = description;
    _status = status;
    _code = code;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Organization.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _fullName = json['full_name'];
    _description = json['description'];
    _status = json['status'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _fullName;
  String? _description;
  bool? _status;
  int? _code;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get fullName => _fullName;
  String? get description => _description;
  bool? get status => _status;
  int? get code => _code;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['full_name'] = _fullName;
    map['description'] = _description;
    map['status'] = _status;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}