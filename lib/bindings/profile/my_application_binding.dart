import 'package:e_space_mobile/controller/profile/application/my_application_controller.dart';
import 'package:get/get.dart';

class MyApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyApplicationController(), fenix: true);
  }
}
