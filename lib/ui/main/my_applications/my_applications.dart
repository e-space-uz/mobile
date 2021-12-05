import 'package:e_space_mobile/controller/profile/application/my_application_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/area/widgets/single_auction_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApplicationsPage extends GetView<MyApplicationController> {
  const MyApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyApplicationController>(
      builder:(logic)=> ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: AppBar(
          title: Text('my_applications'.tr, style: AppTextStyles.appBarTitle,),
        ),
          body:controller.isLoading?
          const SizedBox():
          controller.entitiesDraft.isEmpty?
          Center(child: Text('no_applications_info'.tr,style: AppTextStyles.appBarTitle)):
          Stack(
            children: [
              ListView(
                controller: controller.scrollController,
                padding: EdgeInsets.all(16),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(12),
                      itemBuilder: (_, index) {
                        var data = controller.entitiesDraft[index];
                        return SingleAuctionWidget(
                          onTap: (){
                            Get.toNamed(Routes.MY_APPLICATION_DETAIL,
                                arguments: data.id);
                          },
                          time: data.createdAt??'',
                          id: data.entityNumber?.toString()??'',
                          status: data.status?.name??'',
                          location: '${data.city?.name ?? ''}, ${data.region?.name ?? ''}, ${data.district?.name ?? ''}',
                          statusColor: data.status?.color??'',
                        );
                      },
                      itemCount: controller.entitiesDraft.length,
                      separatorBuilder: (context,index)=> const SizedBox(height: 12),
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
                    )
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
