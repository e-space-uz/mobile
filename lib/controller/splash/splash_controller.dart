import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/models/auth/token_response.dart';
import 'package:e_space_mobile/data/repository/auth_repository.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  AuthRepository? _repository;

  SplashController() {
    _repository = AuthRepository();
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 1500), () async {
      Get.offNamed(Routes.MAIN);
      /* if(localSource.hasProfile()){
        Get.offNamed(Routes.MAIN);
      }else{
        String code = await  Get.toNamed(Routes.WEB_VIEW);
        print('PPPPPPPP- ' + code);
        if(code.isNotEmpty){
          getTokens(code);
        }
      }*/
    });
  }

  Future<void> getTokens(String code) async {
    var response = await _repository?.getTokens(code);
    if (response is TokenResponse) {
      localSource.setTokens(
          response.accessToken ?? '', response.refreshToken ?? '');
      localSource.setProfileHas(true);
      Get.offNamed(Routes.MAIN);
    } else {
      showErrorMessage(response.toString());
    }
  }
}
