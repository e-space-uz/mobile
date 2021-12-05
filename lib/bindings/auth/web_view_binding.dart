
import 'package:e_space_mobile/controller/auth/web_view_controller.dart';
import 'package:get/get.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebViewController());
  }

}