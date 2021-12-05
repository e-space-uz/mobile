import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final bool? showError;

  final TextEditingController? controller;
  final bool? autoFocus;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final BuildContext? context;
  final Function()? onTap;
  final Color backGround;
  final Color hintColor;
  final Color labelColor;
  final Color textColor;
  final Color borderColor;
  final bool enabled;
  final bool readOnly;
  final int? maxLine;
  final double bottomPadding;
  final Widget? suffixIcon;
  final String? mask;

  CustomTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.controller,
    this.autoFocus,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.hintText,
    this.context,
    this.onTap,
    this.backGround = AppColors.white,
    this.borderColor = AppColors.border,
    this.enabled = true,
    this.hintColor = AppColors.black2,
    this.labelColor = AppColors.black2,
    this.textColor = AppColors.mainColor2,
    this.bottomPadding = 12,
    this.suffixIcon,
    this.maxLine,
    this.readOnly = false,
    this.mask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var maskFormatter = new MaskTextInputFormatter(mask: mask, filter: {"#": RegExp(r'[0-9]')});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        RichText(
          text: TextSpan(
            text: labelText,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: labelColor,
            ),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
          controller: controller,
          focusNode: currentFocus,
          onTap: onTap,
          autofocus: autoFocus ?? false,
          textCapitalization: TextCapitalization.sentences,
          onChanged: onChanged,
          onFieldSubmitted: (term) {},
          textInputAction: inputAction,
          maxLines: maxLine,
          readOnly: readOnly,
          // inputFormatters: [maskFormatter],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            filled: true,
            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: backGround,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: hintColor,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabled: enabled,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.assets, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: showError ?? false ? errorText : null,
          ),
          cursorColor: AppColors.assets,
          keyboardType: keyboardType,
        ),
        SizedBox(height: bottomPadding),
      ],
    );
  }
}
