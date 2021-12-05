import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ApplicationItemsWidget extends StatelessWidget {
  const ApplicationItemsWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(title,style: AppTextStyles.yesNoDialog)),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              subTitle,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
