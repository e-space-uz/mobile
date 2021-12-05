import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final bool? check;
  final String? assets;
  final String? svg;

  const LanguageItemWidget({
    Key? key,
    this.text,
    this.check,
    this.assets,
    this.onTap,
    this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Ink(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(12),
                  child: svg!=null?
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                          child: SvgPicture.asset(
                              'assets/svg/$assets.svg',fit: BoxFit.fill)):
                  Image.asset("assets/png/$assets.png"),
                ),
                Text(text ?? '', style: AppTextStyles.languageTitle),
                const Spacer(),
                Visibility(
                  visible: check ?? false,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SvgPicture.asset('assets/svg/ic_checkbox.svg'),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 56),
              child: const Divider( height: 1),
            ),
          ],
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Ink(height: 56),
          ),
        )
      ],
    );
  }
}
