import 'package:e_space_mobile/controller/area/application_details_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/application_details_widget.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/pager_title_widget.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/single_stage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/no_action_widget.dart';

class ApplicationDetailsPage extends GetView<ApplicationDetailsController> {
  const ApplicationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationDetailsController>(
      builder:(controller)=> ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: SampleAppBar(
            title: '№ ${controller.singleEntityModel?.entityNumber??''}'
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
                         title: 'information'.tr,
                         isThis: controller.pageIndex == PAGE_INDEX.FIRST,
                         onTap: (){
                           controller.pageController.animateToPage(0,
                               duration: Duration(seconds: 1), curve:Curves.linearToEaseOut);
                           controller.setPageIndex(0);
                         },
                       ),
                       PagerTitleItem(
                         title: 'action_history'.tr,
                         isThis: controller.pageIndex == PAGE_INDEX.SECOND,
                         onTap: (){
                           controller.pageController.animateToPage(1,
                               duration: Duration(seconds: 1), curve:Curves.linearToEaseOut);
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
                      ApplicationDetailsWidget(
                        date: controller.singleEntityModel?.updatedAt??'',
                        statusColor: controller.singleEntityModel?.status?.color??'',
                        address: controller.singleEntityModel?.address??'',
                        status: controller.singleEntityModel?.status?.name??'',
                        singleEntityDraftResponse: controller.singleEntityModel,
                      ),
                      //second page of pager
                      ListView(
                        // shrinkWrap: true,
                        children: [
                          controller.actionHistories.isEmpty?
                              NoActionWidget(
                                text: 'no_action_text'.tr):
                          Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: ListView.builder(
                                itemCount: controller.actionHistories.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(12),
                                itemBuilder: (context,index){
                                  var data = controller.actionHistories[index];
                                  return SingleStageWidget(
                                      isLastItem: index == controller.actionHistories.length-1,
                                      company: data.user?.organization?.name??'',
                                      date: data.createdAt??'',
                                      person: data.user?.firstName??'',
                                      time: data.createdAt??'',
                                    action: data.action??'',
                                    );
                                }
                            )
                            ),
                        ],
                      ),
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
