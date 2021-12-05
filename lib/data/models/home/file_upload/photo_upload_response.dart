/// file_path : "61431ee82ea2fc551cc08574.svg"

class PhotoUploadResponse {
  String? _filePath;
  String? _fileUrl;

  String? get filePath => _filePath;
  String? get fileUrl => _fileUrl;

  PhotoUploadResponse({
      String? filePath}){
    _filePath = filePath;
}

  PhotoUploadResponse.fromJson(dynamic json) {
    _filePath = json['file_path'];
    _fileUrl = json['file_url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['file_path'] = _filePath;
    map['file_url'] = _fileUrl;
    return map;
  }

}