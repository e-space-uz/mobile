import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? titleWidget;
  final String? title;
  final Widget? action;
  final Widget? leading;
  final double? elevation;

  const SampleAppBar(
      {Key? key,
        this.titleWidget,
        this.title,
        this.action,
        this.leading,
        this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title!,
            style: AppTextStyles.appBarTitle,
          ),
      centerTitle: true,
      leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,size: 20,color: AppColors.black)),
      elevation: elevation ?? 0,
      actions: [action ?? SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
