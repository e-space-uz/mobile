import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TimeTitleIconWidget extends StatelessWidget {
  const TimeTitleIconWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.searchBarBg,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/$icon.svg',
            color: AppColors.black80,
            height: 14,width: 14,),
          SizedBox(width: 6),
          Text(
              title,
              style: AppTextStyles.applicationAcceptDate),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 7,horizontal: 8),
    );
  }
}
