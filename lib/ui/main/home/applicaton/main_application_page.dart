import 'package:e_space_mobile/controller/home/application/application_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/step_pages/applicaton_step_one.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/step_pages/applicaton_step_three.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/step_pages/applicaton_step_two.dart';
import 'package:e_space_mobile/ui/main/map/map/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ApplicationPage extends GetView<ApplicationController> {
  final Entities? entities = (Get.arguments is Entities) ? Get.arguments : null;
  final MapEnterData? mapEnterData =
      (Get.arguments is MapEnterData) ? Get.arguments : null;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: GetBuilder<ApplicationController>(
        initState: (state) {
          if (entities != null) controller.setIndex(1);
        },
        builder: (logic) {
          return ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: WillPopScope(
              onWillPop: () async {
                if (controller.index > 0) {
                  controller.setIndex(controller.index - 1);
                  return false;
                }
                return true;
              },
              child: Scaffold(
                appBar: SampleAppBar(
                  title: 'create_order'.tr,
                ),
                body: IndexedStack(
                  index: logic.index,
                  children: [
                    ApplicationStepOne(
                      mapEnterData: mapEnterData,
                      entities: entities,
                    ),
                    ApplicationStepTwo(isBack: entities == null),
                    ApplicationStepThree(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
