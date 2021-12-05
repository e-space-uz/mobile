import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopTypeWidget extends StatelessWidget {
  const TopTypeWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
    required this.bgContainer,
  }) : super(key: key);
  final String icon;
  final String title;
  final String count;
  final Color bgContainer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgContainer
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 6),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.homeTextType,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(count, style: AppTextStyles.homeTextCount),
          ],
        ),
      ),
    );
  }
}
