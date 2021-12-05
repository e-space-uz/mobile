import 'package:e_space_mobile/controller/area/main_area_controller.dart';
import 'package:e_space_mobile/controller/home/main_home_controller.dart';
import 'package:e_space_mobile/controller/main/main_controller.dart';
import 'package:e_space_mobile/controller/map/main_map_controller.dart';
import 'package:e_space_mobile/controller/profile/application/my_application_controller.dart';
import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/controller/splash/splash_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(),fenix: true);
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => MainHomeController(), fenix: true);
    Get.lazyPut(() => MyApplicationController(), fenix: true);
    Get.lazyPut(() => MainMapController(), fenix: true);
    Get.lazyPut(() => MainProfileController(), fenix: true);
  }
}
