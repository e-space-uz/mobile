/// comment : "string"

class FileUploadRequest {
  String? _comment;

  String? get comment => _comment;

  FileUploadRequest({
      String? comment}){
    _comment = comment;
}

  FileUploadRequest.fromJson(dynamic json) {
    _comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['comment'] = _comment;
    return map;
  }

}