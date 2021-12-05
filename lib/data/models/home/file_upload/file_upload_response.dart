/// file_path : "61431ee82ea2fc551cc08574.svg"

class FileUploadResponse {
  String? _filePath;

  String? get filePath => _filePath;

  FileUploadResponse({
      String? filePath}){
    _filePath = filePath;
}

  FileUploadResponse.fromJson(dynamic json) {
    _filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['file_path'] = _filePath;
    return map;
  }

}