
import 'package:e_space_mobile/controller/area/application_details_controller.dart';
import 'package:get/get.dart';

class ApplicationDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationDetailsController());
  }

}