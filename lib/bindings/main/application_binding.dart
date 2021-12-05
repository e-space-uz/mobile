import 'package:e_space_mobile/controller/home/application/application_controller.dart';
import 'package:e_space_mobile/controller/home/application/application_step_one_controller.dart';
import 'package:e_space_mobile/controller/home/application/application_step_three_controller.dart';
import 'package:e_space_mobile/controller/home/application/application_step_two_controller.dart';
import 'package:get/get.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController(), fenix: true);
    Get.lazyPut(() => ApplicationStepOneController(), fenix: true);
    Get.lazyPut(() => ApplicationStepTwoController(), fenix: true);
    Get.lazyPut(() => ApplicationStepThreeController(), fenix: true);
  }
}
