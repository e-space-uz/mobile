import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SuggestionItemsWidget extends StatelessWidget {
  const SuggestionItemsWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.time,
  }) : super(key: key);

  final String name;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.person,color: AppColors.midGrey,size: 16),
              const SizedBox(width: 12),
              Expanded(child: Text(name,style: AppTextStyles.personName))
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              const Icon(CupertinoIcons.clock,color: AppColors.midGrey,size: 16),
              const SizedBox(width: 12),
              Text(date,style: AppTextStyles.applicationTime),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightTeal,
                  borderRadius: BorderRadius.circular(6)
                ),
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: Text(
                    time,
                    style: AppTextStyles.personName.copyWith(color: Colors.teal)),
              )
            ],
          )
        ],
      ),
    );
  }
}
