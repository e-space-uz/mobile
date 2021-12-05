import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/ui/main/profile/personal_info/widgets/disable_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends GetView<MainProfileController> {
   PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainProfileController>(
      builder:(controller)=> ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: SampleAppBar(
            title: 'personal_info'.tr,
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DisableTextField(
                      label: 'ФИО',
                      hint: controller.profileResponse?.fullName ?? '',
                    ),
                    DisableTextField(
                      label: 'Дата рождения',
                      hint: controller.profileResponse?.birthDate ?? '',
                    ),
                    DisableTextField(
                      label: 'Страна рождения',
                      hint: controller.profileResponse?.citizenship ?? '',
                    ),
                    DisableTextField(
                      label: 'Место рождения',
                      hint: controller.profileResponse?.birthPlace ?? '',
                    ),
                    DisableTextField(
                      label: 'Национальность',
                      hint: controller.profileResponse?.nationality ?? '',
                    ),
                    DisableTextField(
                      label: 'Номер паспорта',
                      hint: controller.profileResponse?.passportNumber ?? '',
                    ),
                    DisableTextField(
                      label: 'Номер телефона',
                      hint: controller.profileResponse?.phoneNumber ?? '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
