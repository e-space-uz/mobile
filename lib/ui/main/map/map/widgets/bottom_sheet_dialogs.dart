import 'package:e_space_mobile/controller/map/map_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/ui/main/area/widgets/filter_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

showFilterBottom(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FilterModalBottomSheet());
}
// no used this function;
showPlaceFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => PlaceFilterModalBottomSheet());
}


class FilterModalBottomSheet extends StatelessWidget {
  const FilterModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      builder: (logic) {
        return Container(
          height: Get.height - 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CustomButton(
                          onTap: () {
                            logic.setMapType(
                                MapTypeEnum.normal);
                          },
                          color: (logic.mapType == MapType.normal)?AppColors.assets:AppColors.background,
                          child: Text(
                            'sxema'.tr,
                              style: AppTextStyles.buttonFilter.copyWith(
                                  color: (logic.mapType == MapType.normal)?
                                  AppColors.white:AppColors.black)
                          )
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                          onTap: () {
                            logic.setMapType(
                                MapTypeEnum.hybrid);
                          },
                          color: (logic.mapType == MapType.hybrid)?AppColors.assets:AppColors.background,
                          child: Text(
                            'satellite'.tr,
                            style: AppTextStyles.buttonFilter.copyWith(
                                color: (logic.mapType == MapType.hybrid)?
                                AppColors.white:AppColors.black),
                          )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 6,
                width: Get.width,
                color: AppColors.background,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  children: [
                    Text(
                        'state_land_plots_process'.tr,
                        style: AppTextStyles.filter
                    ),
                    const SizedBox(height: 12),
                    ColorfulTitleWidget(
                      fillColor: AppColors.white,
                      isBorder:true,
                      title: 'identified_plots_land'.tr,
                    ),
                    ColorfulTitleWidget(
                      fillColor: AppColors.assets,
                      title: 'plots_of_land_in_system'.tr,
                    ),
                    ColorfulTitleWidget(
                      fillColor: AppColors.yellow,
                      title: 'in_discussion_authorities'.tr,
                    ),
                    ColorfulTitleWidget(
                      fillColor: AppColors.green,
                      title: 'Land_on_auction'.tr
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ColorfulTitleWidget extends StatelessWidget {
  const ColorfulTitleWidget({
    Key? key,
    required this.title,
    required this.fillColor,
    this.isBorder = false,
  }) : super(key: key);
  final String title;
  final Color fillColor;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(color:isBorder?AppColors.red:Colors.transparent),
                color: fillColor,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.midGreyPerson.copyWith(
                      color: AppColors.darkGrey)
              ),
            ),

          ]),
    );
  }
}


class PlaceFilterModalBottomSheet extends StatelessWidget {
  const PlaceFilterModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      builder: (controller) {
        return Container(
          height: Get.height - 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            ),
          ),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: [
              const SizedBox(height: 6),
              Text('Филтьр', style: AppTextStyles.filter),
              const SizedBox(height: 12),
              FilterItemsButton(
                image: 'ic_location',
                title: controller.selectedCity?.name ?? 'Область',
                onTap: () {
                  controller.updateVisibility();
                },
                onItemTap: (index) {
                  controller.setRegion(index);
                  controller.updateVisibility();
                },
                isListVisible: controller.isVisible,
                listOfItems: controller.citiesName,
                titleColor: controller.selectedCity==null?
                AppColors.black40:AppColors.black,
              ),
              const SizedBox(height: 12),
              FilterItemsButton(
                image: 'ic_find_me',
                title: controller.selectedRegion?.name ?? 'Регион',
                onTap: () {
                  controller.updateVisibilityRegion();
                },
                onItemTap: (index) {
                  controller.setDistrict(index);
                  controller.updateVisibilityRegion();
                },
                isListVisible: controller.isVisibleRegion,
                listOfItems: controller.regionsName,
                titleColor: controller.selectedRegion==null?
                AppColors.black40:AppColors.black,
              ),
              const SizedBox(height: 12),
              FilterItemsButtonWithMultiCheck(
                image: 'ic_right_left',
                checkedCount: controller.statusCount,
                title: 'Статусы',
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
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
