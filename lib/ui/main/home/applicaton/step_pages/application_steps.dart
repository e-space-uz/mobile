import 'package:e_space_mobile/controller/home/application/application_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApplicationSteps extends GetView<ApplicationController> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: SvgPicture.asset(
            'assets/svg/assignment.svg',
            color: controller.index > -1 ? AppColors.white : AppColors.assets,
          ),
          height: 44,
          width: 44,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: controller.index > -1
                ? AppColors.assets
                : AppColors.blue.withOpacity(0.1),
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: controller.index > 0
                  ? AppColors.assets
                  : AppColors.blue.withOpacity(0.1),
            ),
          ),
        ),
        const SizedBox(width: 6.0),
        Container(
          child: SvgPicture.asset(
            'assets/svg/grass.svg',
            color: controller.index > 0 ? AppColors.white : AppColors.assets,
          ),
          height: 44,
          width: 44,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: controller.index > 0
                ? AppColors.assets
                : AppColors.blue.withOpacity(0.1),
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: controller.index > 1
                  ? AppColors.assets
                  : AppColors.blue.withOpacity(0.1),
            ),
          ),
        ),
        const SizedBox(width: 6.0),
        Container(
          child: SvgPicture.asset(
            'assets/svg/done.svg',
            color: controller.index > 1 ? AppColors.white : AppColors.assets,
          ),
          height: 44,
          width: 44,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: controller.index > 1
                ? AppColors.assets
                : AppColors.blue.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
