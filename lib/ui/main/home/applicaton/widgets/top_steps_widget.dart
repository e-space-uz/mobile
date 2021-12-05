import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/step_pages/application_steps.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TopStepsWidget extends StatelessWidget {
  const TopStepsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "app_for_free_place".tr,
          style: AppTextStyles.profileTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16.0),
        Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'info_about_place'.tr,
                  style: AppTextStyles.applicaitionTitle,
                ),
                const SizedBox(height: 12),
                ApplicationSteps(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
