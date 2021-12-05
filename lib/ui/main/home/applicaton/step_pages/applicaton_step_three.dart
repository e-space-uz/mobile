import 'package:e_space_mobile/controller/home/application/application_controller.dart';
import 'package:e_space_mobile/controller/home/application/application_step_three_controller.dart';
import 'package:e_space_mobile/controller/map/main_map_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/custom_widgets/text_fields/cutom_text_field.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/main_application_page.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/application_items_widget.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/success_dialog.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/top_steps_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ApplicationStepThree extends GetView<ApplicationStepThreeController> {

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: GetBuilder<ApplicationStepThreeController>(
        builder: (controller) {
          return ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: ListView(
                padding: EdgeInsets.all(16), children: [
              TopStepsWidget(),
              Material(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('applicant'.tr, style: AppTextStyles.filter),
                      const SizedBox(height: 8),
                      CustomTextField(
                        labelText: 'fio'.tr,
                        readOnly: true,
                        enabled: false,
                        controller: controller.textFIOController,
                        hintText: 'fio'.tr,
                        labelColor: AppColors.black,
                      ),
                      CustomTextField(
                        inputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        labelText: 'applicant_num'.tr,
                        hintText: '+998 01 234 56 78',
                        controller: controller.textNumberController,
                        mask: '+998 90 ### ## ##',
                        labelColor: AppColors.black,
                        textColor: AppColors.black,
                      ),
                      Text('offer'.tr, style: AppTextStyles.filter),
                      ApplicationItemsWidget(
                          title: 'region'.tr,
                          subTitle: controller.firstStepController.selectedCity?.name??'-'),
                      const Divider(height: 0),
                      ApplicationItemsWidget(
                          title: 'district'.tr,
                          subTitle: controller.firstStepController.selectedRegion?.name ?? '-'),
                      const Divider(height: 0),
                      ApplicationItemsWidget(
                          title: 'village'.tr,
                          subTitle: controller.firstStepController.selectedDistrict?.name??'-'),
                      const Divider(height: 0),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(height: 0),
                          itemCount: controller.firstStepController.groupProperties?.length??0,
                          itemBuilder: (context, index) {
                            var data = controller.firstStepController.groupProperties?[index];
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data?.properties?.length ?? 0,
                              itemBuilder: (context, position) {
                                var itemData = data?.properties?[position];
                                var value = controller.getLabelText(itemData);
                                return ApplicationItemsWidget(
                                    title: itemData?.label ?? '',
                                    subTitle: value);
                              },
                              separatorBuilder:(BuildContext context, int index)=>
                                      const Divider(height: 0),
                            );
                          }),
                      const Divider(height: 0),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(height: 0),
                          itemCount: controller
                              .secondStepController.groupProperties.length,
                          itemBuilder: (context, index) {
                            var data = controller
                                .secondStepController.groupProperties[index];
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.properties?.length ?? 0,
                              itemBuilder: (context, position) {
                                var itemData = data.properties?[position];
                                var value = controller.getLabelText(itemData);
                                return ApplicationItemsWidget(
                                    title: itemData?.label ?? '',
                                    subTitle: value);
                              },
                              separatorBuilder:(context,index) =>
                                      const Divider(height: 0),
                            );
                          }),
                          controller.pointList.isNotEmpty?
                          GetBuilder<MainMapController>(
                              builder: (logic) {
                              logic.setNewPosition(controller.pointList);
                              return Container(
                                height: Get.width / 2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: GoogleMap(
                                    mapType: MapType.normal,
                                    onMapCreated: (GoogleMapController cont) {
                                      logic.setGoogleMapController(cont);
                                      // logic.setNewPosition(controller.pointList);
                                    },
                                    initialCameraPosition: logic.kGooglePlex,
                                    markers: logic.markers,
                                    polygons: logic.createPolygonByPoint(controller.pointList),
                                  ),
                                ),
                              );
                            })
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onTap: () async {
                  var res = await controller.createEntityDraft();
                  if (res)
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (con) => SuccessDialog(
                            onTap: () {
                              Get.until((route) => Get.currentRoute==Routes.MAIN);
                            })
                    );
                },
                child: Text(
                  'continue'.tr,
                  style: AppTextStyles.buttonText,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                color: AppColors.disableButtom,
                onTap: () {
                  Get.find<ApplicationController>().setIndex(2);
                },
                child: Text(
                  'back'.tr,
                  style: AppTextStyles.buttonText,
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}