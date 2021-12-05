import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/ui/main/home/widgets/more_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SingleAuctionWidget extends StatelessWidget {
  const SingleAuctionWidget({
    Key? key,
    this.onTap,
    required this.id,
    required this.status,
    required this.time,
    required this.location,
    required this.statusColor,
  }) : super(key: key);

  final Function()? onTap;
  final String id;
  final String status;
  final String time;
  final String location;
  final String statusColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.white,
          border: Border.all(color: AppColors.black12, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('$id',maxLines: 1, style: AppTextStyles.auctionId)),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: status.length * 10,
                    constraints: BoxConstraints(maxWidth: 160),
                    decoration: BoxDecoration(
                        color: Color(int.parse(
                            '0xFF${statusColor.replaceAll('#', '')}')),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        status,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.auctionStatus,
                        maxLines: 2,
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
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                        child: Row(
                          children: [
                            const SizedBox(width: 14),
                            SvgPicture.asset('assets/svg/ic_calendar.svg',
                                height: 16, width: 16),
                            const SizedBox(width: 14),
                            Text(
                                DateFormat('dd.MM.yyyy')
                                    .format(DateTime.parse(time)),
                                style: AppTextStyles.auctionDate)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(children: [
                          const SizedBox(width: 14),
                          SvgPicture.asset('assets/svg/ic_location.svg',
                              height: 16, width: 16),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(location,
                                style: AppTextStyles.auctionDate),
                          )
                        ]),
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
