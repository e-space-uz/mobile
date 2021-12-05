import 'package:e_space_mobile/controller/main/main_controller.dart';
import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YesNoDialog extends StatelessWidget {
  final String? positive;
  final String? negative;
  final String? message;
  final String? title;

  const YesNoDialog(
      {Key? key, this.positive, this.negative, this.message, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: AppTextStyles.appBarTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              message ?? '',
              style: AppTextStyles.yesNoDialog,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                  Expanded(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: AppColors.bgTabBar,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        negative ?? '',
                        style: AppTextStyles.positiveBtn,
                      ),
                    ),
                  ),
                SizedBox(
                  width: 16.0,
                ),
                  Expanded(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.red,
                      onPressed: () {
                        Get.find<MainController>().setMenu(0);
                        Get.find<MainProfileController>().localSource.setProfileHas(false);
                        Get.offNamedUntil(Routes.INITIAL, (route) => false);
                      },
                      child: Text(
                        positive ?? '',
                        style: AppTextStyles.negativeBtn,
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
