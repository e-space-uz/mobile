import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key,required this.onTap}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(16)
              ),
              child: SvgPicture.asset('assets/svg/ic_success_check.svg',
                height: 34,width: 34,),
            ),
            const SizedBox(height: 16),
            Text('congratulations'.tr,style: AppTextStyles.appBarTitle),
            const SizedBox(height: 10),
            Text('application_dialog_text'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyles.download),
            const SizedBox(height: 20),
            CustomButton(
                onTap: onTap ,
                color: AppColors.green,
                child:
                Text('continue'.tr,style: AppTextStyles.buttonText)
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
