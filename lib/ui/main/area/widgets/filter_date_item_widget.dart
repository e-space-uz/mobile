import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class FilterItemDateButton extends StatelessWidget {

  FilterItemDateButton({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isPickerVisible,
    required this.onDateTap,
    required this.titleColor,
    this.currentDate,
    required this.showResult
  }) : super(key: key);

  final String image;
  final String title;
  final Function() onTap;
  final Function(DateTime dateTime) onDateTap;
  final bool isPickerVisible;
  final Color titleColor;
  final DateTime? currentDate;
  final Function() showResult;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 12 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.black12,width: 1),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/$image.svg',
                    height: 16,width: 16,color: AppColors.black60),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                      title,
                      style: AppTextStyles.applicationAcceptDate
                          .copyWith(color: titleColor)),
                ),
                const SizedBox(width: 8),
                const Icon(CupertinoIcons.chevron_down,size: 16,color: AppColors.black40)
              ],
            ),
          ),
        ),
        Visibility(
          visible: isPickerVisible,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.searchBarBg,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: currentDate??DateTime.now(),
                      onDateTimeChanged: (value){
                        onDateTap(value);
                      }),
                ),
                const SizedBox(height: 6),
                CustomButton(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.assets,
                  onTap: showResult,
                  child: Text('filter'.tr),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}