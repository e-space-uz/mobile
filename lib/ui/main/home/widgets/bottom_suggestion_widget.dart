import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class BottomSuggestionWidget extends StatelessWidget {
  const BottomSuggestionWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset('assets/png/application.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'instruction_about_offer'.tr,
              style: AppTextStyles.applicationTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: onTap,
              child: Text(
                'left_offer'.tr,
                style: AppTextStyles.buttonText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
