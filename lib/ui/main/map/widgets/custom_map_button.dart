import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MapCustomButton extends StatelessWidget {
  const MapCustomButton({
    Key? key,
    this.onTap,
    this.size=32,
    this.icon,
    this.buttonColor,
    this.iconColor,
  }) : super(key: key);
  final Function()? onTap;
  final String? icon;
  final double size;
  final Color? buttonColor;
  final Color? iconColor;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor ?? AppColors.white,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size,
          width: size,
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/svg/$icon.svg',
              color: iconColor??AppColors.darkGrey),
        ),
      ),
    );
  }
}
