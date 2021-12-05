import 'package:e_space_mobile/core/custom_paints/ic_no_history.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoActionWidget extends StatelessWidget {
  const NoActionWidget({
    Key? key,
    required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
           const CustomPaint(
            painter: const NoActionCustomPainter(),
            size: const Size(170, 170),
          ),
          const SizedBox(height: 20),
           Text(
            text,
            style: AppTextStyles.applicationTitle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
