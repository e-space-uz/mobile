import 'package:e_space_mobile/controller/profile/application/my_application_details_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/no_action_widget.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/pager_title_widget.dart';
import 'package:e_space_mobile/ui/main/my_applications/widgets/application_action_info_widget.dart';
import 'package:e_space_mobile/ui/main/my_applications/widgets/application_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApplicationDetailsPage extends GetView<MyApplicationDetailsController> {
  const MyApplicationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyApplicationDetailsController>(
      builder:(controller)=> ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: SampleAppBar(
            title: '${'offer'.tr} № ${controller.singleEntityDraft?.entityDraftNumber??''}',
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16,10,16,16),
                    decoration: BoxDecoration(
                        color: AppColors.bgTabBar,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        PagerTitleItem(
                          title: 'my_application'.tr,
                          isThis: controller.pageIndex == PAGE_INDEX.FIRST,
                          onTap: (){
                            controller.pageController.animateToPage(0,
                                duration: Duration(seconds: 1), curve:Curves.linearToEaseOut);
                            controller.setPageIndex(0);
                          },
                        ),
                        PagerTitleItem(
                          title: 'area'.tr,
                          isThis: controller.pageIndex == PAGE_INDEX.SECOND,
                          onTap: (){
                            controller.pageController.animateToPage(1,
                                duration: Duration(seconds: 1),
                                curve:Curves.linearToEaseOut);
                            controller.setPageIndex(1);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index){
                      controller.setPageIndex(index);
                    },
                    children: [
                      //first page of pager
                      ApplicationInfoWidget(
                        singleEntityDraftResponse: controller.singleEntityDraft,
                      ),
                      //second page of pager
                      (controller.singleEntityDraft?.entity !=null)?
                      ApplicationActionInfoWidget(
                        actionHistories: controller.actionHistories,
                        entity: controller.singleEntityDraft?.entity,
                        entityDraftsApplicants: controller.entityDraftsApplicants):
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NoActionWidget(
                            text: 'no_action_history'.tr),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}