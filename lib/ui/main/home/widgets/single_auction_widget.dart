import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'more_button_widget.dart';

class SingleAuctionWidget extends StatelessWidget {
  const SingleAuctionWidget({
    Key? key,
    required this.id,
    required this.time,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.onTap,
  }) : super(key: key);

  final String id;
  final String time;
  final String location;
  final String status;
  final String statusColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: Get.width * 288 / 375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.black12,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text('$id', style: AppTextStyles.auctionId),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    width: status.length * 10,
                    margin: EdgeInsets.only(left: 6),
                    constraints: BoxConstraints(maxWidth: 160),
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse('0xFF${statusColor.replaceAll('#', '')}'),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        status,
                        style: AppTextStyles.auctionStatus,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 6),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            SvgPicture.asset(
                              'assets/svg/ic_calendar.svg',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              DateFormat('dd.MM.yyyy').format(
                                DateTime.parse(time),
                              ),
                              style: AppTextStyles.auctionDate,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            SvgPicture.asset(
                              'assets/svg/ic_location.svg',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                location,
                                style: AppTextStyles.auctionDate,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MoreButtonWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
