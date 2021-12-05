import 'package:e_space_mobile/controller/map/simple_map_controller.dart';
import 'package:e_space_mobile/ui/main/map/widgets/custom_map_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapPage extends GetView<SimpleMapController> {
  SimpleMapPage({Key? key}) : super(key: key);
  final String pointsSting = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SimpleMapController>(
      initState: (state) {
        controller.createPolygonByValue(pointsSting);
      },
      builder: (logic) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  mapType: controller.mapType,
                  onMapCreated: (GoogleMapController cont) {
                    controller.setGoogleMapController(cont);
                  },
                  initialCameraPosition: controller.kGooglePlex,
                  markers: controller.markers,
                  polygons: controller.polygon,
                  polylines: controller.polyline,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  indoorViewEnabled: false,
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 5,
                    child: MapCustomButton(
                      size: 40,
                      onTap: () async {
                        Get.back();
                      },
                      icon: 'ic_make_smaller',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
