
class RefreshTokenResponse {
  String? _accessToken;
  String? _refreshToken;
  bool? _verified;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool? get verified => _verified;

  RefreshTokenResponse({
      String? accessToken, 
      String? refreshToken, 
      bool? verified}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _verified = verified;
}

  RefreshTokenResponse.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
    _verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    map['verified'] = _verified;
    return map;
  }

}