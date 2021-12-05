import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';


class PagerTitleItem extends StatelessWidget {
  const PagerTitleItem({
    Key? key,
    required this.title,
    required this.isThis,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isThis;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: isThis? Colors.grey.withOpacity(0.5):Colors.transparent,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              color: isThis?AppColors.white:Colors.transparent
          ),
          child: Text(
              title,
              style: AppTextStyles.pagerTitle),
        ),
      ),
    );
  }
}