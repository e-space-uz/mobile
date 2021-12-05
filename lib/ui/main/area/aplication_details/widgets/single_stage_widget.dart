import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/time_title_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleStageWidget extends StatelessWidget {
  const SingleStageWidget({
    Key? key,
    required this.isLastItem,
    required this.date,
    required this.time,
    required this.company,
    required this.person,
    required this.action,
  }) : super(key: key);

  final bool isLastItem;
  final String date;
  final String time;
  final String company;
  final String person;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimeTitleIconWidget(
                  icon: 'ic_calendar',
                  title: DateFormat('dd.MM.yyyy').format(DateTime.parse(date))
              ),
              SizedBox(height: 8),
              TimeTitleIconWidget(
                  icon: 'ic_clock',
                  title: DateFormat.Hm().format(
                      DateTime.parse(date).add(Duration(hours: 5)))
              ),
            ],
          ),
          SizedBox(width: 12),
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: isLastItem,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.assets,
                          width: 2
                        )
                      ),
                      width: 18,
                      height: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: isLastItem?0:4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.assets,
                    ),
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
              Visibility(
                visible: !isLastItem,
                child: Container(
                  margin: EdgeInsets.only(left: isLastItem?0:4),
                  height: isLastItem?94:102,
                  width: 2,
                  color: AppColors.assets,
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                company.isNotEmpty?
                Text(company,
                    style: AppTextStyles.applicationDate):
                const SizedBox(),
                const SizedBox(height: 4),
                person.isNotEmpty?
                Text('($person)\n$action',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.midGreyPerson,
                ):
                Text(
                  action,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.midGreyPerson,
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
