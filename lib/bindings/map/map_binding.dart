import 'package:e_space_mobile/controller/map/map_controller.dart';
import 'package:get/get.dart';

class MapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MapController(),fenix: false);
  }

}