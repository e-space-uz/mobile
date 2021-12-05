import 'package:e_space_mobile/controller/area/main_area_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/flappy_searchbar/flappy_search_bar.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/no_action_widget.dart';
import 'package:e_space_mobile/ui/main/area/widgets/filter_active_status_widget.dart';
import 'package:e_space_mobile/ui/main/area/widgets/filter_drawer.dart';
import 'package:e_space_mobile/ui/main/area/widgets/single_auction_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MainAreaPage extends GetView<MainAreaController> {
   MainAreaPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key =  GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: GetBuilder<MainAreaController>(
        builder:(controller)=> ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            key: _key,
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: SearchBar<Entities>(
                  title: 'personal_info'.tr,
                  titleStyle: AppTextStyles.appBarTitle,
                  searchBarPadding: const EdgeInsets.only(
                    top: 16, left: 16, right: 8, bottom: 8,
                  ),
                  listPadding: const EdgeInsets.symmetric(horizontal: 10),
                  loader:const SpinKitFadingCircle(color: AppColors.assets, size: 60.0),
                  onSearch: (word) async {
                    return [];
                  },
                  placeHolder: LiquidPullToRefresh(
                    color: AppColors.white,
                    springAnimationDurationInMilliseconds:700,
                    backgroundColor: AppColors.assets,
                    showChildOpacityTransition: false,
                    onRefresh: () {
                      return controller.getEntitiesForRefresh();
                    },
                    child: Material(
                      color: AppColors.background,
                      child: Stack(
                        children: [
                          ListView(
                            controller: controller.scrollController,
                            padding: EdgeInsets.all( 16),
                            children: [
                              Wrap(children: [
                                FilterActiveStatusWidget(
                                  title: controller.selectedCity?.name??'',
                                  onTap: () {
                                    controller.clearRegion();
                                  },
                                  visibility: controller.selectedCity != null,
                                  ),
                                FilterActiveStatusWidget(
                                    title: controller.selectedRegion?.name??'',
                                    onTap: () {
                                      controller.clearDistrict();
                                    },
                                  visibility:controller.selectedRegion != null ,
                                ),
                                FilterActiveStatusWidget(
                                    title: controller.selectedStatus?.name??'',
                                    onTap: () {
                                      controller.clearStatus();
                                    },
                                  visibility: controller.selectedStatus != null,
                                ),
                                FilterActiveStatusWidget(
                                  title: controller.selectedDate,
                                  onTap: () {
                                    controller.clearDate();
                                  },
                                  visibility: controller.selectedDate.isNotEmpty,
                                )
                              ]),
                              controller.entities.isEmpty?
                                  NoActionWidget(
                                    text: 'place_not_found'.tr):
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: controller.entities.length,
                                  padding: EdgeInsets.all(12),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    var data = controller.entities[index];
                                    return SingleAuctionWidget(
                                      onTap: (){
                                        Get.toNamed(Routes.APPLICATION_DETAILS,
                                            arguments: data.id);
                                      },
                                      time: data.createdAt??'',
                                      id: data.entityNumber?.toString()??'',
                                      status: data.status?.name??'',
                                      location: data.address??'',
                                      statusColor: data.status?.color??'',
                                    );
                                  },
                                  separatorBuilder: (context,index)=>
                                  const SizedBox(height: 12),
                                ),
                              ),
                            ],
                          ),
                          Obx(()=> Visibility(
                                visible: controller.isPagingProcess.value,
                                child:
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 120,
                                    alignment: Alignment.bottomCenter,
                                    child: const CupertinoActivityIndicator(radius: 26),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ),
                  cancellationWidget: Text("cancel".tr),
                  hintText: 'search'.tr,
                  hintStyle: AppTextStyles.hintStyle,
                  emptyWidget: Center(child: Text("offer_not_found".tr)),
                  indexedScaledTileBuilder: (int index) =>
                      ScaledTile.count(1, index.isEven ? 2 : 1),
                  onCancelled: () {
                    print("Cancelled triggered");
                  },
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  onFilterTap: (){
                    _key.currentState!.openEndDrawer();
                  },
                  onItemFound: (Entities? data, int index) {
                    return SingleAuctionWidget(
                      id: data?.entityNumber.toString()??'',
                      status: data?.status?.name??'',
                      location: data?.address??'',
                      time: data?.createdAt??'',
                      statusColor: data?.status?.color??'',
                    );
                  }
              ),
            ),
            endDrawer: SafeArea(child: FilterDrawer()),
          ),
        ),
      ),
    );
  }
}
