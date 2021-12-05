import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'single_auction_widget.dart';

class AuctionsListWidget extends StatelessWidget {
  const AuctionsListWidget({
    Key? key,
    required this.entities,
  }) : super(key: key);
  final List<Entities> entities;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            for(int i=0 ; i < entities.length ; i++)
            SingleAuctionWidget(
              id: entities[i].entityNumber?.toString() ?? '',
              time: entities[i].createdAt ?? '',
              location: entities[i].address ?? '',
              status: entities[i].status?.name ?? '',
              statusColor: entities[i].status?.color ?? '',
              onTap: () {
                Get.toNamed(Routes.APPLICATION_DETAILS, arguments: entities[i].id);
              },
            )
          ],
        ),
      ),
    );
    /* return Container(
      height: 180,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          var data = entities[index];
          return SingleAuctionWidget(
            id: data.entityNumber?.toString() ?? '',
            time: data.createdAt ?? '',
            location: data.address ?? '',
            status: data.status?.name ?? '',
            statusColor: data.status?.color ?? '',
            onTap: () {
              Get.toNamed(Routes.APPLICATION_DETAILS, arguments: data.id);
            },
          );
        },
        itemCount: entities.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );*/
  }
}
