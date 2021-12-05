import 'package:e_space_mobile/core/custom_widgets/text_fields/always_disabled_focus_node.dart';
import 'package:e_space_mobile/core/custom_widgets/text_fields/cutom_text_field.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DisableTextField extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final String? hint;
  final Widget? suffixIcon;

   DisableTextField(
      {Key? key, this.label, this.hint, this.suffixIcon, this.labelColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: label,
      hintText: hint,
      currentFocus: AlwaysDisabledFocusNode(),
      backGround: AppColors.disableColor,
      borderColor: AppColors.border,
      enabled: true,
      controller: TextEditingController(),
      readOnly: true,
      hintColor: AppColors.black3,
      labelColor: labelColor ?? AppColors.disableText,
      bottomPadding: 0,
      suffixIcon: suffixIcon,
    );
  }
}
