import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language_item_widget.dart';

class LanguageBottomSheet extends StatelessWidget {
  final Function(String value)? onTap;
  final String text;
  final BuildContext? context;

  const LanguageBottomSheet(
      {Key? key, this.onTap, this.text = '', this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "language".tr,
                style: AppTextStyles.profileTitle,
              ),
            ),
            LanguageItemWidget(
              onTap: () => onTap!('ru'),
              text: "Русский",
              assets: 'ic_russian',
              check: 'ru' == text,
            ),
            LanguageItemWidget(
              onTap: () => onTap!('uz'),
              text: 'O\’zbekcha',
              assets: 'ic_uzbek',
              check: 'uz' == text,
            ),
            LanguageItemWidget(
              onTap: () => onTap!("kaa"),
              text: "Kaa",
              assets: 'ic_flag_krp',
              check: "kaa" == text,
              svg: 'svg',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
