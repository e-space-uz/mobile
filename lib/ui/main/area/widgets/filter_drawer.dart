import 'package:e_space_mobile/controller/area/main_area_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_item_widget.dart';

class FilterDrawer extends StatelessWidget {
   FilterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAreaController>(
      builder:(controller)=> Drawer(
        child: Material(
            color: AppColors.white,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('filter'.tr,style: AppTextStyles.filter),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon:const Icon(Icons.close,size: 18,color: AppColors.midGrey),
                      )
                    ]
                ),
                const SizedBox(height: 12),
                /*CustomDropDown(
                  value: controller.selectedCity?.name,
                  hint: 'region'.tr,
                  onChanged: (value) {
                    controller.setRegion(controller.citiesName.indexOf(value??''));
                    // controller.updateVisibility();
                  },
                  listOfItems: controller.citiesName,
                ),*/
                FilterItemsButton(
                  image: 'ic_location',
                  title: controller.selectedCity?.name??'region'.tr,
                  onTap: () {
                    controller.updateVisibility();
                    },
                  onItemTap: (index){
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
                  title: controller.selectedRegion?.name??'district'.tr,
                  onTap: () {
                    controller.updateVisibilityRegion();
                  },
                  onItemTap: (index) {
                    controller.setDistrict(index);
                    controller.updateVisibilityRegion();
                  },
                  isListVisible:controller.isVisibleRegion,
                  listOfItems: controller.regionsName,
                  titleColor:controller.selectedRegion==null?
                  AppColors.black40:AppColors.black ,
                ),
                const SizedBox(height: 12),
                FilterItemsButton(
                  image: 'ic_right_left',
                  title: controller.selectedStatus?.name??'status'.tr,
                  onTap: () {
                    controller.updateVisibilityStatus();
                  },
                  onItemTap: (index){
                    controller.setStatuses(index);
                    controller.updateVisibilityStatus();
                  },
                  isListVisible: controller.isVisibleStatus,
                  listOfItems: controller.statusesName,
                  titleColor: controller.selectedStatus==null?AppColors.black40:AppColors.black,
                ),
                // const SizedBox(height: 12),
              /*  FilterItemDateButton(
                  image: 'ic_clock',
                  title: 'date_application'.tr,
                  onTap: () {
                    controller.updateVisibilityDatePicker();
                  },
                  titleColor: AppColors.black40,
                  onDateTap: (DateTime dateTime) {
                    controller.setNewDate(dateTime);
                  },
                  currentDate: controller.dateTime,
                  isPickerVisible: controller.isVisibleDatePicker,
                  showResult: () {
                    Get.back();
                    controller.dateSelected();
                  },
                ),*/
              ],
            ),
          ),
      ),
    );
  }
}
