import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatelessWidget {
  final Function(bool)? onChanged;
  final String text;
  final bool value;

  const CustomSwitchWidget({
    Key? key,
    this.onChanged,
    required this.text,
    this.value = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppTextStyles.filter)),
          CupertinoSwitch(
            onChanged: onChanged,
            value: value,
            activeColor: AppColors.assets,
          )
        ],
      ),
    );
  }
}
