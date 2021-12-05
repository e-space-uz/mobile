import 'package:e_space_mobile/controller/home/main_home_controller.dart';
import 'package:e_space_mobile/controller/map/map_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

showInfoDialog() async {
  final result = await Get.defaultDialog(
    title: "",
    content: Container(
      width: 325/375 * Get.width,
      // height: 372,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          SvgPicture.asset(
            "assets/svg/map_dialog.svg",
            width: 200/375 * Get.width,
            height: 160,
          ),
          const SizedBox(height: 20),
          Text(
            "gps_info_diolog".tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.appBarTitle.copyWith(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomButton(
              color: AppColors.blue10,
              onTap: () {
                Get.back(result: true);
              },
              child: Text(
                "continue".tr,
                style: AppTextStyles.appBarTitle.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  if (result == true) {
    Get.find<MapController>().changeStart(result);
    // final resume = await Get.bottomSheet(
    //
    //   backgroundColor: Colors.transparent,
    // );

    // if (resume == true) {}
  }
}

showPolygonInfoDialog(Entities entities) async {
   await Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 325/375 * Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(CupertinoIcons.clear,color: AppColors.black40,size: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Yer Uchaskasi',
                      style: AppTextStyles.applicationTopTitle),
                  TitleSubTitleColorWidget(
                    subTitle: entities.status?.name??'',
                    title: 'condition'.tr
                  ),
                  TitleSubTitleColorWidget(
                    title: 'region'.tr,
                    subTitle: entities.city?.name??'',
                    color: AppColors.background,
                  ),
                  TitleSubTitleColorWidget(
                    title: 'district'.tr,
                    subTitle: entities.region?.name??'',
                  ),
                  TitleSubTitleColorWidget(
                    title: 'village'.tr,
                    subTitle: entities.district?.name??'',
                    color: AppColors.background,
                  ),
                  TitleSubTitleColorWidget(
                    title: 'area_of_place'.tr,
                    subTitle: ((entities.areaOfSurface??0)/100.0).toString(),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    color: AppColors.blue10,
                    onTap: () async {
                      bool result = await Get.find<MainHomeController>().checkAuth();
                      if(result)
                      Get.toNamed(Routes.APPLICATION,arguments: entities);
                    },
                    child: Text(
                      "enter_offer".tr,
                      style: AppTextStyles.appBarTitle.copyWith(
                        color: AppColors.white,
                      ),
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

showDialogExit() async {
  final result = await Get.defaultDialog(
    title: "message".tr,
    titlePadding: EdgeInsets.only(top: 12),
    content: Container(
      width: 328,
      // height: 108,
      padding: EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            'warning_about_exit_map'.tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.appBarTitle.copyWith(
                fontSize: 15,
                color: AppColors.black2,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomButton(
                  color: AppColors.lightGrey,
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "cancel".tr,
                    style: AppTextStyles.appBarTitle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: CustomButton(
                  color: AppColors.red400,
                  onTap: () {
                    // Get.offNamedUntil(Routes.MAIN, (route) => false);
                    Get.close(2);
                  },
                  child: Text(
                    "yes".tr,
                    style: AppTextStyles.appBarTitle.copyWith(
                      color: AppColors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  if (result == true) {
    // controller.changeStart(result);
    Get.find<MapController>().changeStart(result);
    // final resume = await Get.bottomSheet(
    //
    //   backgroundColor: Colors.transparent,
    // );

    // if (resume == true) {}
  }
}


class TitleSubTitleColorWidget extends StatelessWidget {
  const TitleSubTitleColorWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.color,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      color: color??Colors.transparent,
      child: Row(children: [
        Expanded(child:
        Text(
            title,
            style: AppTextStyles.applicationTitle)
        ),
        Expanded(child:
        Text(
            subTitle,
            textAlign: TextAlign.end,
            style: AppTextStyles.applicationTime)
        ),
      ]),
    );
  }
}
