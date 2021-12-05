class EntityApplicantsResponse {
  String? address;
  City? city;
  String? createdAt;
  String? deadline;
  City? district;
  List<EntityDrafts>? entityDrafts;
  List<EntityFiles>? entityFiles;
  List<String>? entityGallery;
  String? entityNumber;
  List<EntityProperties>? entityProperties;
  String? entitySoato;
  String? entityStatusUpdate;
  int? entityTypeCode;
  String? id;
  Organizations? organizations;
  City? region;
  String? registrationDate;
  String? revertComment;
  Status? status;
  String? updatedAt;
  int? version;

  EntityApplicantsResponse(
      {this.address,
        this.city,
        this.createdAt,
        this.deadline,
        this.district,
        this.entityDrafts,
        this.entityFiles,
        this.entityGallery,
        this.entityNumber,
        this.entityProperties,
        this.entitySoato,
        this.entityStatusUpdate,
        this.entityTypeCode,
        this.id,
        this.organizations,
        this.region,
        this.registrationDate,
        this.revertComment,
        this.status,
        this.updatedAt,
        this.version});

  EntityApplicantsResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    createdAt = json['created_at'];
    deadline = json['deadline'];
    district =
    json['district'] != null ? new City.fromJson(json['district']) : null;
    if (json['entity_drafts'] != null) {
      entityDrafts = <EntityDrafts>[];
      json['entity_drafts'].forEach((v) {
        entityDrafts?.add(new EntityDrafts.fromJson(v));
      });
    }
    if (json['entity_files'] != null) {
      entityFiles = <EntityFiles>[];
      json['entity_files'].forEach((v) {
        entityFiles?.add(new EntityFiles.fromJson(v));
      });
    }
    entityGallery = json['entity_gallery'].cast<String>();
    entityNumber = json['entity_number'];
    if (json['entity_properties'] != null) {
      entityProperties = <EntityProperties>[];
      json['entity_properties'].forEach((v) {
        entityProperties?.add(new EntityProperties.fromJson(v));
      });
    }
    entitySoato = json['entity_soato'];
    entityStatusUpdate = json['entity_status_update'];
    entityTypeCode = json['entity_type_code'];
    id = json['id'];
    organizations = json['organizations'] != null
        ? new Organizations.fromJson(json['organizations'])
        : null;
    region = json['region'] != null ? new City.fromJson(json['region']) : null;
    registrationDate = json['registration_date'];
    revertComment = json['revert_comment'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    updatedAt = json['updated_at'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    data['created_at'] = this.createdAt;
    data['deadline'] = this.deadline;
    if (this.district != null) {
      data['district'] = this.district?.toJson();
    }
    if (this.entityDrafts != null) {
      data['entity_drafts'] = this.entityDrafts?.map((v) => v.toJson()).toList();
    }
    if (this.entityFiles != null) {
      data['entity_files'] = this.entityFiles?.map((v) => v.toJson()).toList();
    }
    data['entity_gallery'] = this.entityGallery;
    data['entity_number'] = this.entityNumber;
    if (this.entityProperties != null) {
      data['entity_properties'] =
          this.entityProperties?.map((v) => v.toJson()).toList();
    }
    data['entity_soato'] = this.entitySoato;
    data['entity_status_update'] = this.entityStatusUpdate;
    data['entity_type_code'] = this.entityTypeCode;
    data['id'] = this.id;
    if (this.organizations != null) {
      data['organizations'] = this.organizations?.toJson();
    }
    if (this.region != null) {
      data['region'] = this.region?.toJson();
    }
    data['registration_date'] = this.registrationDate;
    data['revert_comment'] = this.revertComment;
    if (this.status != null) {
      data['status'] = this.status?.toJson();
    }
    data['updated_at'] = this.updatedAt;
    data['version'] = this.version;
    return data;
  }
}

class City {
  int? code;
  String? id;
  String? name;
  String? ruName;
  int? soato;

  City({this.code, this.id, this.name, this.ruName, this.soato});

  City.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    name = json['name'];
    ruName = json['ru_name'];
    soato = json['soato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['id'] = this.id;
    data['name'] = this.name;
    data['ru_name'] = this.ruName;
    data['soato'] = this.soato;
    return data;
  }
}

class EntityDrafts {
  Applicant? applicant;
  City? city;
  String? comment;
  String? createdAt;
  City? district;
  int? entityNumber;
  String? entitySoato;
  String? id;
  City? region;
  Status? status;
  String? updatedAt;

  EntityDrafts(
      {this.applicant,
        this.city,
        this.comment,
        this.createdAt,
        this.district,
        this.entityNumber,
        this.entitySoato,
        this.id,
        this.region,
        this.status,
        this.updatedAt});

  EntityDrafts.fromJson(Map<String, dynamic> json) {
    applicant = json['applicant'] != null
        ? new Applicant.fromJson(json['applicant'])
        : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    comment = json['comment'];
    createdAt = json['created_at'];
    district =
    json['district'] != null ? new City.fromJson(json['district']) : null;
    entityNumber = json['entity_number'];
    entitySoato = json['entity_soato'];
    id = json['id'];
    region = json['region'] != null ? new City.fromJson(json['region']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.applicant != null) {
      data['applicant'] = this.applicant?.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    if (this.district != null) {
      data['district'] = this.district?.toJson();
    }
    data['entity_number'] = this.entityNumber;
    data['entity_soato'] = this.entitySoato;
    data['id'] = this.id;
    if (this.region != null) {
      data['region'] = this.region?.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status?.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Applicant {
  String? name;
  String? phoneNumber;
  String? userId;

  Applicant({this.name, this.phoneNumber, this.userId});

  Applicant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['user_id'] = this.userId;
    return data;
  }
}

class Status {
  String? code;
  String? color;
  String? createdAt;
  String? description;
  String? id;
  bool? isActive;
  String? name;
  String? parentStatusId;
  String? ruName;
  int? typeCode;
  String? updatedAt;

  Status(
      {this.code,
        this.color,
        this.createdAt,
        this.description,
        this.id,
        this.isActive,
        this.name,
        this.parentStatusId,
        this.ruName,
        this.typeCode,
        this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    color = json['color'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    isActive = json['is_active'];
    name = json['name'];
    parentStatusId = json['parent_status_id'];
    ruName = json['ru_name'];
    typeCode = json['type_code'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['parent_status_id'] = this.parentStatusId;
    data['ru_name'] = this.ruName;
    data['type_code'] = this.typeCode;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EntityFiles {
  String? comment;
  String? fileName;
  String? id;
  String? url;
  String? user;

  EntityFiles({this.comment, this.fileName, this.id, this.url, this.user});

  EntityFiles.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    fileName = json['file_name'];
    id = json['id'];
    url = json['url'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['file_name'] = this.fileName;
    data['id'] = this.id;
    data['url'] = this.url;
    data['user'] = this.user;
    return data;
  }
}

class EntityProperties {
  Property? property;
  String? value;

  EntityProperties({this.property, this.value});

  EntityProperties.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.property != null) {
      data['property'] = this.property?.toJson();
    }
    data['value'] = this.value;
    return data;
  }
}

class Property {
  String? description;
  String? id;
  bool? isRequired;
  String? label;
  String? name;
  String? placeholder;
  List<PropertyOptions>? propertyOptions;
  bool? status;
  String? type;
  String? validation;
  bool? withConfirmation;

  Property(
      {this.description,
        this.id,
        this.isRequired,
        this.label,
        this.name,
        this.placeholder,
        this.propertyOptions,
        this.status,
        this.type,
        this.validation,
        this.withConfirmation});

  Property.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    isRequired = json['is_required'];
    label = json['label'];
    name = json['name'];
    placeholder = json['placeholder'];
    if (json['property_options'] != null) {
      propertyOptions = <PropertyOptions>[];
      json['property_options'].forEach((v) {
        propertyOptions?.add(new PropertyOptions.fromJson(v));
      });
    }
    status = json['status'];
    type = json['type'];
    validation = json['validation'];
    withConfirmation = json['with_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['is_required'] = this.isRequired;
    data['label'] = this.label;
    data['name'] = this.name;
    data['placeholder'] = this.placeholder;
    if (this.propertyOptions != null) {
      data['property_options'] =
          this.propertyOptions?.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['type'] = this.type;
    data['validation'] = this.validation;
    data['with_confirmation'] = this.withConfirmation;
    return data;
  }
}

class PropertyOptions {
  String? name;
  String? value;

  PropertyOptions({this.name, this.value});

  PropertyOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Organizations {
  bool? additionalProp1;
  bool? additionalProp2;
  bool? additionalProp3;

  Organizations(
      {this.additionalProp1, this.additionalProp2, this.additionalProp3});

  Organizations.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}
