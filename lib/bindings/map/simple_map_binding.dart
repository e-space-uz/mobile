
import 'package:e_space_mobile/controller/map/simple_map_controller.dart';
import 'package:get/get.dart';

class SimpleMapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SimpleMapController());
  }
}