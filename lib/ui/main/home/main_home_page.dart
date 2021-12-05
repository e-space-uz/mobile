import 'package:e_space_mobile/controller/home/main_home_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/area/widgets/single_auction_widget.dart';
import 'package:e_space_mobile/ui/main/home/widgets/auctions_list_widget.dart';
import 'package:e_space_mobile/ui/main/home/widgets/bottom_new_widget.dart';
import 'package:e_space_mobile/ui/main/home/widgets/bottom_suggestion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainHomePage extends GetView<MainHomeController> {
  MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: Text('e-Space'.tr, style: AppTextStyles.appBarTitle),
            automaticallyImplyLeading: false,
            leading: Padding(
                padding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                child: Image.asset('assets/svg/appstore.png', height: 16, width: 16)),
            centerTitle: false,
            actions: [SvgPicture.asset('assets/svg/ic_bell.svg', height: 30, width: 30), const SizedBox(width: 12)],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                BottomSuggestionWidget(onTap: () {
                  controller.checkAuthWithOneId();
                }),
                if (LocalSource.getInstance().hasProfile())
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'my_applications'.tr,
                              style: AppTextStyles.auctionTypeTopTitle,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'all'.tr,
                            style: AppTextStyles.newsBody.copyWith(color: AppColors.darkGrey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 188,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.white,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(12),
                          itemBuilder: (_, index) {
                            var data = controller.entitiesDraft[index];
                            return SizedBox(
                              height: 156,
                              width: Get.width - 100,
                              child: SingleAuctionWidget(
                                onTap: () {
                                  Get.toNamed(Routes.MY_APPLICATION_DETAIL, arguments: data.id);
                                },
                                time: data.createdAt ?? '',
                                id: data.entityNumber?.toString() ?? '',
                                status: data.status?.name ?? '',
                                location: '${data.city?.name ?? ''}, ${data.region?.name ?? ''}, ${data.district?.name ?? ''}',
                                statusColor: data.status?.color ?? '',
                              ),
                            );
                          },
                          itemCount: controller.entitiesDraft.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 12),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'place_around'.tr,
                        style: AppTextStyles.auctionTypeTopTitle,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'all'.tr,
                      style: AppTextStyles.newsBody.copyWith(color: AppColors.darkGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AuctionsListWidget(entities: controller.entities),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'coming_auction_places'.tr,
                        style: AppTextStyles.auctionTypeTopTitle,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'all'.tr,
                      style: AppTextStyles.newsBody.copyWith(color: AppColors.darkGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AuctionsListWidget(
                  entities: controller.entities,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
