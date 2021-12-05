import 'package:e_space_mobile/data/keys/app_keys.dart';
import 'package:get_storage/get_storage.dart';

class LocalSource {
  var _localStorage = GetStorage();

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else
      return LocalSource._();
  }

  String getLocale() {
    return _localStorage.read<String>(AppKeys.LOCALE) ?? 'uz';
  }

  setLocale(String local) {
    return _localStorage.write(AppKeys.LOCALE, local);
  }

  setTokens(String aToken, String rToken){
    _localStorage.write(AppKeys.ACCESS_TOKEN,aToken);
    _localStorage.write(AppKeys.REFRESH_TOKEN,rToken);
  }

  String getAccessToken() {
    return _localStorage.read<String>(AppKeys.ACCESS_TOKEN) ?? '';
  }

  String getRefreshToken() {
    return _localStorage.read<String>(AppKeys.REFRESH_TOKEN) ?? '';
  }

  setProfileHas(bool has){
    _localStorage.write(AppKeys.HAS_PROFILE,has);
  }

  bool hasProfile() {
    return _localStorage.read<bool>(AppKeys.HAS_PROFILE) ?? false;
  }

}
