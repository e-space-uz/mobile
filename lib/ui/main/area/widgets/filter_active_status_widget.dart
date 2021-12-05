import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class FilterActiveStatusWidget extends StatelessWidget {
  const FilterActiveStatusWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.visibility,
  }) : super(key: key);
  final String title;
  final Function()? onTap;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Container(
        margin: EdgeInsets.only(right: 12,bottom: 12),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.black12,width: 1)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                title,
                style: AppTextStyles.applicationDate),
            SizedBox(width: 8),
            InkWell(
                onTap: onTap,
                child: Icon(Icons.close,size: 16,color: AppColors.darkGrey)
            )
          ],
        ),
      ),
    );
  }
}
