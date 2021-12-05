import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Function()? onTap;

  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Ink(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(11),
        decoration: const BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: SvgPicture.asset(icon),
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.assets,
      ),
      onTap: onTap,
    );
  }
}
