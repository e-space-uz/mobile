import 'package:e_space_mobile/controller/home/main_home_controller.dart';
import 'package:e_space_mobile/controller/map/map_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/map/map/widgets/bottom_sheet_dialogs.dart';
import 'package:e_space_mobile/ui/main/map/map/widgets/dialogs.dart';
import 'package:e_space_mobile/ui/main/map/widgets/custom_map_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends GetView<MapController> {
   GoogleMapPage({Key? key}) : super(key: key);

  final FilteredFields? filteredFields =
  (Get.arguments is FilteredFields) ? Get.arguments : null;

   final MapEnterData? mapEnterData =
   (Get.arguments is MapEnterData) ? Get.arguments : null;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      initState: (state) {
        if((mapEnterData?.pointList??[]).isNotEmpty){
          print('EEEEEEEEEEEEEEEEEEEe');
          controller.activeGreenButton((mapEnterData?.pointList.length??0) > 2);
          controller.addAllPoints(mapEnterData?.pointList??[]);
          controller.setPolygonWithoutUpdate();
        }
        if(filteredFields is FilteredFields){
          controller.getEntitiesByFilter(filteredFields);
        }
      },
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          if(mapEnterData?.fromWhichPage =='from_application') {
            await showDialogExit();
            return false;
          }
          return true;
        },
        child: Scaffold(
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
                  myLocationButtonEnabled: true,
                  indoorViewEnabled: false,
                  onTap: (point) {
                    if (controller.isPolygon) {
                      controller.setPolygonPoints(point);
                      if (controller.pointList.length >= 2)
                        controller.setPolygon();
                    }
                  },
                ),
                Positioned(
                  top: 12, left: 12,
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 5,
                    child: MapCustomButton(
                      size: 40,
                      onTap: () async {
                        if(mapEnterData?.fromWhichPage =='from_application'){
                          await  showDialogExit();
                        }else{
                          Get.back();
                        }
                      },
                      icon: mapEnterData == null ?
                      'ic_make_smaller' : 'home',
                    ),
                  ),
                ),
                Positioned(
                  top: 12, right: 12,
                  child: Column(
                    children: [
                      Visibility(
                        visible: controller.isDoneButtonVisible,
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 5,
                          child: MapCustomButton(
                            size: 40,
                            onTap: () {
                              if(controller.pointList.length<3){
                                return;
                              }
                              double area= controller.areaPolygon(controller.pointList).toDouble();
                              MapReturnData data = MapReturnData(
                                  area:area,
                                  pointList: controller.pointList);
                              Get.back(result: data);
                            },
                            icon: 'ic_done',
                            iconColor: controller.isGreen?AppColors.white:null,
                            buttonColor: controller.isGreen?AppColors.green:null,
                          ),
                        ),
                      ),
                      SizedBox(height: controller.isDoneButtonVisible? 12:0),
                      Visibility(
                        visible: mapEnterData == null,
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 5,
                          child: MapCustomButton(
                            size: 40,
                            onTap: () {
                              showFilterBottom(context);
                            },
                            icon: 'ic_layer',
                          ),
                        ),
                      ),
                     /* const SizedBox(height: 12),
                      Visibility(
                        visible: mapEnterData == null,
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 5,
                          child: MapCustomButton(
                            size: 40,
                            onTap: () {
                              showPlaceFilterBottomSheet(context);
                            },
                            icon: 'ic_filter',
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MapCustomButton(
                            size: 40,
                            onTap: () {
                              controller.isMarker = false;
                              controller.isPolygon = true;
                              if(mapEnterData?.fromWhichPage=='from_application')
                              controller.setDoneButtonVisibleValue();
                              controller.showBottomSheet();
                            },
                            icon: 'ic_frame',
                            iconColor: controller.isPolygon?
                            AppColors.assets:AppColors.darkGrey,
                          ),
                          const SizedBox(
                            width: 40,
                            child: const Divider(
                              height: 1,
                              color: AppColors.white60,
                            ),
                          ),
                          MapCustomButton(
                            size: 40,
                            icon: 'ic_foot_print',
                            onTap: () {
                              controller.clearPolygon();
                              showInfoDialog();
                              // controller.setDoneButtonVisibleValue();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MapCustomButton(
                            size: 40,
                            onTap: () {
                              controller.mapController?.moveCamera(CameraUpdate.zoomIn());
                            },
                            icon: 'ic_plus',
                          ),
                          const SizedBox(
                            width: 40,
                            child: const Divider(
                              height: 1,
                              color: AppColors.white60,
                            ),
                          ),
                          MapCustomButton(
                            size: 40,
                            icon: 'ic_minus',
                            onTap: () {
                              controller.mapController?.
                              moveCamera(CameraUpdate.zoomOut());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: controller.showStart ?
          SafeArea(
            child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)
                      ),
                      color: AppColors.white,
                    ),
                    child: CustomButton(
                      color: AppColors.green,
                      onTap: () {
                          controller.changeMove(true);
                          controller.addPoint();
                      },
                      child: Text(
                        "begin".tr,
                        style: AppTextStyles.appBarTitle.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ):
          controller.showBottomSheetTool ?
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "press_for_con".tr,
                        style: AppTextStyles.applicationName.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                      Obx(()=> Text(
                          "${controller.areaSquare.value} ${'sotix'.tr}",
                          style: AppTextStyles.applicationName.copyWith(
                              color: AppColors.darkGrey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Visibility(
                    visible:( controller.pointList.length>2 &&
                        mapEnterData?.fromWhichPage!='from_application'),
                    child: CustomButton(
                      color: AppColors.assets,
                      onTap: () async {
                        double area= controller.areaPolygon(controller.pointList).toDouble();
                        bool result = await Get.find<MainHomeController>().checkAuth();
                        if(result){
                          Get.toNamed(
                              Routes.APPLICATION,
                              arguments:MapEnterData(
                                  fromWhichPage: 'from_map',
                                  pointList: controller.pointList,
                                  area: area
                              )
                          );
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/ic_inbox.svg"),
                          const SizedBox(width: 8),
                          Text(
                            'send_offer'.tr,
                            style:
                            AppTextStyles.applicationDate.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    color: AppColors.assets,
                    onTap: () {
                      controller.removePolygonLastPoint();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/delete.svg",color: AppColors.white,),
                        const SizedBox(width: 8),
                        Text(
                          "delete_last_point".tr,
                          style:
                          AppTextStyles.applicationDate.copyWith(
                            color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ) :
          controller.showMove ?
          SafeArea(
            child:
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "continue_walking".tr,
                        style: AppTextStyles.applicationName.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                      Obx(()=> Text(
                        "${controller.areaSquare.value} ${'sotix'.tr}",
                        style: AppTextStyles.applicationName.copyWith(
                            color: AppColors.darkGrey, fontSize: 14),
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  controller.switchForOrderAndGpsButton?
                  CustomButton(
                    color: AppColors.assets,
                    onTap: () {
                      controller.endPoint();
                      Get.snackbar(
                          'message'.tr, 'signed_point'.tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.disableText,
                          colorText: AppColors.white,
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(bottom: 200,left: 20,right: 20),
                          borderRadius: 6
                      );
                      controller.polygonArea();
                      controller.setSwitchForOrderAndGps(false);
                      },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/location.svg"),
                        const SizedBox(width: 8),
                        Text(
                          "sign_your_point".tr,
                          style:
                          AppTextStyles.applicationDate.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ):
                  CustomButton(
                    color: AppColors.assets,
                    onTap: () async {
                      double area= controller.areaPolygon(controller.pointList).toDouble();
                      bool result = await Get.find<MainHomeController>().checkAuth();
                      if(result){
                        Get.toNamed(
                            Routes.APPLICATION,
                            arguments:MapEnterData(
                                fromWhichPage: 'from_map',
                                pointList: controller.pointList,
                                area: area
                            )
                        );
                      }
                      },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/ic_inbox.svg"),
                        const SizedBox(width: 8),
                        Text(
                          'send_offer'.tr,
                          style:
                          AppTextStyles.applicationDate.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    color: AppColors.white60,
                    onTap: () {
                      controller.removeLastPoint();
                      },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/delete.svg"),
                        const SizedBox(width: 8),
                        Text(
                          "delete_last_point".tr,
                          style: AppTextStyles.applicationDate.copyWith(
                            color: AppColors.midGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ) : const SizedBox(),
        )
      ),
    );
  }
}

class MapReturnData {
  final double area;
  final List<LatLng> pointList;

  MapReturnData({
    required this.area,
    required this.pointList});
}

class MapEnterData {
  final String fromWhichPage;
  final List<LatLng> pointList;
  final double? area;

  MapEnterData({
    required this.fromWhichPage,
    required this.pointList,
    this.area
  });
}

class FilteredFields {
  final String? cityId;
  final String? regionId;
  final String? statusId;

  FilteredFields({
    this.cityId,
    this.regionId,
    this.statusId});
}