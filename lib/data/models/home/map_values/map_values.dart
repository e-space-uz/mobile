
class MapDataProperties {
  String? type;
  Geometry? geometry;

  MapDataProperties({this.type, this.geometry});

  MapDataProperties.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    geometry = json['geometry'] != null ? new Geometry.fromJson(json['geometry']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.geometry != null) {
      data['geometry'] = this.geometry?.toJson();
    }
    return data;
  }
}

class Geometry {
  List<List<List<String>>>? coordinates;
  Geometry({ this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates?.map((v) => v).toList();
    }
    return data;
  }
}

