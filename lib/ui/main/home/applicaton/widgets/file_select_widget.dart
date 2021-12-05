import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/ui/main/profile/personal_info/widgets/disable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class FileChooseWidget extends StatelessWidget {
  const FileChooseWidget({
    Key? key,
    this.onTap,
    required this.fileName,
  }) : super(key: key);
  final Function()? onTap;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return DisableTextField(
      label:
      "file_about".tr,
      hint: fileName.isNotEmpty?fileName:
      'no_file_chosen'.tr,
      suffixIcon: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          onTap: onTap,
          splashColor: AppColors.black.withOpacity(0.2),
          child: Ink(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border.all(color: AppColors.border)),
            child: Center(
              child: Text(
                'choose_file'.tr,
                style: AppTextStyles.applicationTime,
              ),
            ),
          ),
        ),
      ),
      labelColor: AppColors.black,
    );
  }

}
