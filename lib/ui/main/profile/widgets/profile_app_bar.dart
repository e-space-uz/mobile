import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileAppBar extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? action;

  const ProfileAppBar({Key? key, this.title, this.subTitle, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      elevation: 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 24,bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        title??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.profileTitle),
                  const SizedBox(height: 6.0),
                    Text(
                        subTitle??'',
                        style: AppTextStyles.midGreyPerson.copyWith(fontSize: 15))
                ],
              ),
            ),
          ),
          if (action != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    Get.toNamed(Routes.PERSONAL_INFO);
                  },
                  child: Ink(
                    child: Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(11.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: AppColors.black.withOpacity(0.1))),
                        child: SvgPicture.asset(action??'')
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
