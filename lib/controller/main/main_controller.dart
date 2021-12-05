import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/data/models/auth/token_response.dart';
import 'package:e_space_mobile/data/repository/home_repository.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  late final HomeRepository _homeRepository;

  MainController() {
    _homeRepository = HomeRepository();
  }

  BottomMenu _bottomMenu = BottomMenu.HOME;

  void setMenu(int index) async {

    if(BottomMenu.values[index] == BottomMenu.AREA && !localSource.hasProfile()) {
      checkAuthWithOneId();
    }
    else if(BottomMenu.values[index] == BottomMenu.PROFILE && !localSource.hasProfile()){
       checkAuthWithOneId();
    }else{
      _bottomMenu = BottomMenu.values[index];
      update();
    }
  }

  Future<void> checkAuthWithOneId() async {
      String code = await  Get.toNamed(Routes.WEB_VIEW);
      if(code.isNotEmpty){
         getTokens(code);
      }
    }

  Future<void> getTokens(String code) async {
    var response = await _homeRepository.getTokens(code);
    if(response is TokenResponse){
      _bottomMenu = BottomMenu.PROFILE;
      localSource.setTokens(response.accessToken??'',
          response.refreshToken??'');
      localSource.setProfileHas(true);
      Get.find<MainProfileController>().getProfileDetails();
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  BottomMenu get bottomMenu => _bottomMenu;
}

enum BottomMenu { HOME, AREA,MAP, PROFILE }
