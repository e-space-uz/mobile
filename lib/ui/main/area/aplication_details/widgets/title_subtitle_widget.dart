import 'package:e_space_mobile/core/constants/constants.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/button_download.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.fileType,
    this.fileUrl,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String? fileType;
  final String? fileUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
                title,
                style: AppTextStyles.applicationDate),
          ),
          fileType==null?
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                  subTitle,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.applicationTime),
            ),
          ):
          ButtonDownloadWidget(
            onTap: () {
              launchURL('${Constants.imageBaseUrl}$subTitle');
            },
            title: 'PDF ',
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

