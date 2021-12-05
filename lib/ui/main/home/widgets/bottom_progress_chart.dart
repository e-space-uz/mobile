import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BottomProgressChart extends StatelessWidget {
  const BottomProgressChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: AppColors.white),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            animateFromLastPercent: true,
            startAngle: 90,
            backgroundColor: AppColors.lightGreen,
            animation: true,
            percent: (75) / 100.0,
            center: Text(
              "${75}%",
              style: AppTextStyles.percent,
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.green,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'В Республике',
                    style: AppTextStyles.percentTitle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${75}%",
                    style: AppTextStyles.percentBigger,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
