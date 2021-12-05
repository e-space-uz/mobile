import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:e_space_mobile/data/models/profile/profile_info/profile_response.dart';
import 'package:e_space_mobile/data/repository/profile_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MainProfileController extends BaseController {
  ProfileRepository? _profileRepository ;

  MainProfileController(){
    _profileRepository = ProfileRepository();
  }

  RxString _lang = Get.locale.toString().obs;
  LocalSource _localSource = LocalSource.getInstance();

  ProfileResponse? _profileResponse;
  ProfileResponse? get profileResponse => _profileResponse;

  onInit(){
    super.onInit();
  }

  onReady() async {
    super.onReady();
    if(localSource.hasProfile()){
      await getProfileDetails();
    }
  }

  Future<void> getProfileDetails() async {
    setLoading(true);
    var response = await _profileRepository?.
    getProfileDetails(localSource.getAccessToken());
    setLoading(false);
    if(response is ProfileResponse){
      _profileResponse = response;
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  void setLang(String value) {
    _lang.value = value;
    _localSource.setLocale(value);
  }

  String getLocale(String value) {
    if (value == 'ru') {
      return 'Русский';
    } else if (value == 'uz') {
      return 'O\’zbekcha';
    } else {
      return 'English';
    }
  }

  RxString get lang => _lang;
}
