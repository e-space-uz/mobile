import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/dialog/yes_no_dialog.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/profile/widgets/language_bottom_sheet.dart';
import 'package:e_space_mobile/ui/main/profile/widgets/profile_app_bar.dart';
import 'package:e_space_mobile/ui/main/profile/widgets/profile_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfilePage extends GetView<MainProfileController> {
  const MainProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainProfileController>(
        builder:(controller)=> ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: Scaffold(
            body: Column(
              children: [
                ProfileAppBar(
                  title:'${controller.profileResponse?.lastName??''} '
                      '${controller.profileResponse?.firstName??''}',
                  subTitle: controller.profileResponse?.phoneNumber??'',
                  action: 'assets/svg/ic_edit.svg',
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Material(
                      color: AppColors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProfileItemWidget(
                            title: 'notifications'.tr,
                            icon: 'assets/svg/ic_notifications.svg',
                            onTap: () {},
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Divider(height: 1),
                          ),
                          ProfileItemWidget(
                            title: 'language'.tr,
                            icon: 'assets/svg/ic_language.svg',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return LanguageBottomSheet(
                                      text: controller.lang.value,
                                      onTap: (value) {
                                        controller.setLang(value);
                                        Get.updateLocale(Locale(value));
                                      },
                                    );
                                },
                              );
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Divider(height: 1),
                          ),
                          ProfileItemWidget(
                            title: 'settings'.tr,
                            icon: 'assets/svg/ic_setting.svg',
                            onTap: () {},
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Divider(height: 1),
                          ),
                          ProfileItemWidget(
                            title: 'logout'.tr,
                            icon: 'assets/svg/ic_logout.svg',
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return YesNoDialog(
                                    title: 'message'.tr,
                                    message: 'exit_app_dialog'.tr,
                                    positive: 'yes'.tr,
                                    negative: "no".tr,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}