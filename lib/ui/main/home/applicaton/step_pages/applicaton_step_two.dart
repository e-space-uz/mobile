import 'package:e_space_mobile/controller/home/application/application_controller.dart';
import 'package:e_space_mobile/controller/home/application/application_step_two_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/custom_widgets/dropdown/dropdown_button.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/custom_widgets/text_fields/cutom_text_field.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/file_select_widget.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/setting_item_widget.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/top_steps_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ApplicationStepTwo extends GetView<ApplicationStepTwoController> {
  final bool isBack;

  ApplicationStepTwo({required this.isBack});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: GetBuilder<ApplicationStepTwoController>(
          builder: (logic) {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TopStepsWidget(),
              Material(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.groupProperties.length,
                          itemBuilder: (con, index) {
                            var data = controller.groupProperties[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name ?? '',
                                    style: AppTextStyles.filter),
                                const SizedBox(height: 6),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.properties?.length??0,
                                    itemBuilder: (context, ind) {
                                      var item = data.properties?[ind];
                                      switch (item?.type ?? '') {
                                        case 'radio':
                                          List<String> listOfItems = [];
                                          if (controller.objectTypeId ==
                                              (item?.id ?? '')) {
                                            listOfItems.addAll(controller
                                                .constructionTypesNames);
                                          } else {
                                            item?.propertyOptions
                                                ?.forEach((element) {
                                              listOfItems.add(element.name ?? '');
                                            });
                                          }
                                          return CustomDropDown(
                                            value: item?.radio,
                                            label: item?.label ?? '',
                                            hint: item?.placeholder ?? 'tanlang',
                                            onChanged: (value) {
                                              if (controller.objectTypeId == (item?.id ?? '')) {
                                                controller.constructionTypes.forEach((element) {
                                                  if (element.name == value) {
                                                    controller.groupProperties[index]
                                                        .properties?[ind].radio = element.id;
                                                  }
                                                });
                                              } else {
                                                item?.propertyOptions?.forEach((element) {
                                                  if (element.name == value) {
                                                    controller.groupProperties[index]
                                                        .properties?[ind].radio = element.value;
                                                  }
                                                });
                                              }
                                              controller.groupProperties[index].properties?[ind].radio = value;
                                              controller.update();
                                            },
                                            listOfItems: listOfItems,
                                          );

                                        case 'checkbox':
                                          List<String> listOfItems = [];
                                          item?.propertyOptions?.forEach((element) {
                                            listOfItems.add(element.name ?? '');
                                          });
                                          return Column(
                                            children: [
                                              CustomDropDown(
                                                value: item?.radio,
                                                label: item?.label ?? '',
                                                hint: item?.placeholder ??
                                                    'tanlang',
                                                onChanged: (value) {
                                                  controller.groupProperties[index].properties?[ind].
                                                  checkBox.addIf(!(controller.groupProperties[index].
                                                  properties?[ind].checkBox.contains(value) ?? true),
                                                          value ?? '');
                                                  controller.update();
                                                },
                                                listOfItems: listOfItems,
                                              ),
                                              Visibility(
                                                  visible: item?.checkBox.isNotEmpty ?? false,
                                                  child: const SizedBox(height: 6)),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Wrap(
                                                  children: [
                                                    for (int i = 0; i < (item?.checkBox.length ?? 0); i++)
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                                                        margin: EdgeInsets.all(4),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: AppColors.black3, width: 1),
                                                            borderRadius: BorderRadius.circular(4)),
                                                        child: Text(item?.propertyOptions?[i].name ??''),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );

                                        case 'boolean':
                                          return CustomSwitchWidget(
                                            text: item?.label ?? '',
                                            onChanged: (value) {
                                              controller.groupProperties[index]
                                                  .properties?[ind].switchType = value;
                                              controller.update();
                                            },
                                            value: item?.switchType ?? false,
                                          );

                                        case 'string':
                                          return CustomTextField(
                                            labelText: item?.label ?? '',
                                            hintText: item?.placeholder ?? '',
                                            keyboardType: TextInputType.text,
                                            onChanged: (value) {
                                              controller.groupProperties[index]
                                                  .properties?[ind].input = value;
                                            },
                                            controller: TextEditingController(
                                                text: item?.input),
                                            labelColor: AppColors.black,
                                          );

                                        case 'textarea':
                                          return CustomTextField(
                                            maxLine: 4,
                                            borderColor: AppColors.border,
                                            controller: TextEditingController(
                                                text: item?.textArea),
                                            labelText: item?.label ?? '',
                                            hintText: item?.placeholder ?? '',
                                            onChanged: (value) {
                                              controller
                                                  .groupProperties[index].properties?[ind].textArea = value;
                                            },
                                            labelColor: AppColors.black,
                                          );

                                        case 'number':
                                          return CustomTextField(
                                            labelText: item?.label ?? '',
                                            hintText: item?.placeholder ?? '',
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              controller.groupProperties[index]
                                                  .properties?[ind].inputNumber = value;
                                            },
                                            controller: TextEditingController(
                                                text: item?.inputNumber),
                                            labelColor: AppColors.black,
                                          );

                                        case 'date':
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 4),
                                              Text(item?.label ?? '',style: AppTextStyles.applicationTime),
                                              Container(
                                                margin: EdgeInsets.only(top: 4,bottom: 12),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(color: AppColors.lightGrey, width: 2),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await selectDate(context);
                                                    controller.groupProperties[index].properties?[ind]
                                                        .date = controller.birthDate;
                                                  },
                                                  child: Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(controller.birthDate.isNotEmpty?
                                                                  DateFormat('dd.MM.yyyy').
                                                              format(DateTime.parse(controller.birthDate)):'select_date'.tr
                                                              )
                                                          ),
                                                          const Icon(
                                                              CupertinoIcons.calendar,
                                                              size: 20,
                                                              color: AppColors.black3)
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ],
                                          );
                                        case 'file':
                                          return FileChooseWidget(
                                            onTap: () async {
                                              await controller.uploadFile();
                                              controller.groupProperties[index].properties?[ind]
                                                  .fileName = controller.fileName;
                                              controller.groupProperties[index].properties?[ind]
                                                  .fileUrl = controller.fileUploadResponse?.filePath ?? '';
                                            },
                                            fileName: controller.fileName,
                                          );
                                        case 'map':
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item?.label ?? '',
                                                style: AppTextStyles.applicationTime,
                                              ),
                                              const SizedBox(height: 12),
                                              InkWell(
                                                onTap: () async {
                                                  List<LatLng> pointList =
                                                      await Get.toNamed(Routes.GOOGLE_MAP,
                                                          arguments: 'from_application');
                                                  if (pointList.isNotEmpty) {
                                                    controller.groupProperties[index]
                                                        .properties?[ind].pointMapList = pointList;
                                                  }
                                                },
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SvgPicture.asset('assets/svg/navigator.svg'),
                                                    const SizedBox(width: 12),
                                                    Text(
                                                      'draw_place_on_map'.tr,
                                                      style: AppTextStyles.applicationTime
                                                          .copyWith(color: AppColors.assets),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: CustomTextField(
                                                      labelColor: AppColors.black,
                                                      labelText: item?.label ?? '',
                                                      keyboardType: TextInputType.numberWithOptions(),
                                                      readOnly: true,
                                                      enabled: false,
                                                      controller: controller
                                                          .textAreaQuantityController,
                                                      onChanged: (value) {
                                                        controller.groupProperties[index].properties?[ind].map = value;
                                                      },
                                                      hintText: item?.placeholder ?? '',
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                            bottom: 12.0, left: 8.0),
                                                    child: Material(
                                                      color: Colors.blue.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(6.0),
                                                      child: InkWell(
                                                        borderRadius: BorderRadius.circular(6.0),
                                                        onTap: () {
                                                          controller.setIsInputEnable();
                                                        },
                                                        child: Ink(
                                                          height: 48,
                                                          width: 48,
                                                          child: const Icon(
                                                              Icons.edit,
                                                              color: AppColors.assets),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                      }
                                      return const SizedBox();
                                    })
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onTap: () {
                  controller.isNext();
                },
                child: Text(
                  'continue'.tr,
                  style: AppTextStyles.buttonText,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                color: AppColors.disableButtom,
                onTap: () {
                  if (isBack) Get.find<ApplicationController>().setIndex(0);
                },
                child: Text(
                  'back'.tr,
                  style: AppTextStyles.buttonText,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  selectDate(BuildContext context) async {
    var selectedDate;
    if(controller.birthDate.isEmpty)
      selectedDate = DateTime.now();
    else selectedDate = DateTime.parse(controller.birthDate);
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        DateTime? tempPickedDate;
        return Container(
          height: 300,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16))
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    initialDateTime: selectedDate,
                    minimumDate: DateTime(1940, 01, 01),
                    minimumYear: 1940,
                    // maximumYear: DateTime.now().year,
                    // maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  onTap: () {
                    if(tempPickedDate==null){
                      tempPickedDate = selectedDate;
                    }
                    Get.back(result: tempPickedDate);
                  },
                  child: Text(
                    'select'.tr,
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      controller.birthDate = selectedDate.toString();
      controller.update();
    }else{

    }
  }
}
