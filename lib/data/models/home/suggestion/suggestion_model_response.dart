
class SuggestionModelResponse {
  String? _id;

  String? get id => _id;

  SuggestionModelResponse({
      String? id}){
    _id = id;
}

  SuggestionModelResponse.fromJson(dynamic json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }

}