import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MoreButtonWidget extends StatelessWidget {
  const MoreButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.background, width: 1),
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: AppColors.assets,
      ),
    );
  }
}
