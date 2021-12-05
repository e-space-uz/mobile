import 'package:e_space_mobile/controller/map/main_map_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/area/widgets/filter_item_widget.dart';
import 'package:e_space_mobile/ui/main/map/widgets/custom_map_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map/google_map_page.dart';

class MainMapPage extends GetView<MainMapController> {
  MainMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainMapController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: Text('map'.tr, style: AppTextStyles.appBarTitle),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(16),
                  children: [
                    Text('filter'.tr, style: AppTextStyles.filter),
                    const SizedBox(height: 12),
                    FilterItemsButton(
                      image: 'ic_location',
                      title: controller.selectedCity?.name ?? 'region'.tr,
                      onTap: () {
                        controller.updateVisibility();
                      },
                      onItemTap: (index) {
                        controller.setRegion(index);
                        controller.updateVisibility();
                      },
                      isListVisible: controller.isVisible,
                      listOfItems: controller.citiesName,
                      titleColor: controller.selectedCity == null
                          ? AppColors.black40
                          : AppColors.black,
                    ),
                    const SizedBox(height: 12),
                    FilterItemsButton(
                      image: 'ic_find_me',
                      title: controller.selectedRegion?.name ?? 'district'.tr,
                      onTap: () {
                        controller.updateVisibilityRegion();
                      },
                      onItemTap: (index) {
                        controller.setDistrict(index);
                        controller.updateVisibilityRegion();
                      },
                      isListVisible: controller.isVisibleRegion,
                      listOfItems: controller.regionsName,
                      titleColor: controller.selectedRegion == null
                          ? AppColors.black40
                          : AppColors.black,
                    ),
                    const SizedBox(height: 12),
                    FilterItemsButtonWithMultiCheck(
                      image: 'ic_right_left',
                      checkedCount: controller.statusCount,
                      title: 'status'.tr,
                      onTap: () {
                        controller.updateVisibilityStatus();
                      },
                      onItemTap: (index) {
                        controller.setStatuses(index);
                        // controller.updateVisibilityStatus();
                      },
                      isListVisible: controller.isVisibleStatus,
                      listOfItems: controller.statusesName,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onTap: () {
                        // logic.getEntitiesByFilter();
                        Get.toNamed(Routes.GOOGLE_MAP,
                            arguments: FilteredFields(
                                cityId: controller.selectedCity?.id ?? '',
                                regionId: controller.selectedRegion?.id ?? '',
                                statusId: controller.selectedStatus?.id ?? ''));
                      },
                      child: Text(
                        'filter'.tr,
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController cont) {
                          controller.setGoogleMapController(cont);
                        },
                        initialCameraPosition: controller.kGooglePlex,
                        markers: controller.markers,
                        polygons: controller.polygon,
                        myLocationEnabled: true,
                        onTap: (point) {
                          if (controller.isPolygon) {
                            controller.setPolygonPoints(point);
                            controller.setPolygon();
                          } else if (controller.isMarker) {
                            controller.clearMarkers();
                            controller.setMarker(point);
                          }
                        },
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: MapCustomButton(
                        onTap: () {
                          Get.toNamed(Routes.GOOGLE_MAP);
                        },
                        icon: 'ic_make_bigger',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
