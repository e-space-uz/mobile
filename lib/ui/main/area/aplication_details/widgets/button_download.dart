import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ButtonDownloadWidget extends StatelessWidget {
  const ButtonDownloadWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: AppColors.black12
            )
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/ic_download.svg',
                height: 14,width: 14,color: AppColors.black50),
            SizedBox(width: 10),
            Text(title,style: AppTextStyles.download)
          ],
        ),
      ),
    );
  }
}
