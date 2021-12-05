import 'package:e_space_mobile/controller/profile/application/my_application_details_controller.dart';
import 'package:get/get.dart';

class MyApplicationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyApplicationDetailsController());
  }
}
