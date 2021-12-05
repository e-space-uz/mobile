import 'package:e_space_mobile/controller/home/application/application_step_one_controller.dart';
import 'package:e_space_mobile/core/custom_widgets/custom_button/custom_button.dart';
import 'package:e_space_mobile/core/custom_widgets/dropdown/dropdown_button.dart';
import 'package:e_space_mobile/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:e_space_mobile/core/custom_widgets/text_fields/cutom_text_field.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/custom_image_buttons.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/file_select_widget.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/setting_item_widget.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/widgets/top_steps_widget.dart';
import 'package:e_space_mobile/ui/main/map/map/google_map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ApplicationStepOne extends GetView<ApplicationStepOneController> {

  final MapEnterData? mapEnterData;
  final Entities? entities;
  ApplicationStepOne({this.mapEnterData,this.entities});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: GetBuilder<ApplicationStepOneController>(
          initState: (state) async {
            await controller.getCities();
            await controller.getOneSuggestion(1, 4);
            if(entities != null)
            controller.setEntity(entities);
          },
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
                      Text('address'.tr,style: AppTextStyles.filter),
                      const SizedBox(height: 6),
                      CustomDropDown(
                        value: controller.region,
                        label: 'region'.tr,
                        hint: 'select_area'.tr,
                        onChanged: (value) {
                          controller.setRegion(value);
                        },
                        listOfItems: controller.citiesName
                      ),
                      CustomDropDown(
                        value: controller.district,
                        label: 'district'.tr,
                        hint: 'select_district'.tr,
                        onChanged: (value) {
                          controller.setDistrict(value);
                        },
                        listOfItems: controller.regionsName
                      ),
                      CustomDropDown(
                        value: controller.quarter,
                        label: 'village'.tr,
                        hint: 'select_village'.tr,
                        onChanged: (value) {
                          controller.setQuarter(value);
                        },
                        listOfItems: controller.districtsName
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.groupProperties?.length,
                          itemBuilder: (con,index){
                            var data = controller.groupProperties?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: (data?.name??'')!='Адрес',
                                  child: Text(
                                      '${data?.name??''}',
                                      style: AppTextStyles.filter)
                                ),
                                const SizedBox(height: 6),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data?.properties?.length??0,
                                    itemBuilder: (context,ind) {
                                      var item = data?.properties?[ind];
                                      switch (item?.type??'') {
                                        case 'radio':
                                          List<String> listOfItems = [];
                                          item?.propertyOptions?.forEach((element) {
                                            listOfItems.add(element.name??'');
                                          });
                                          return  CustomDropDown(
                                            value: item?.radio,
                                            label: item?.label??'',
                                            hint: item?.placeholder,
                                            onChanged: (value) {
                                              controller.groupProperties?[index].
                                              properties?[ind].radio=value;
                                            },
                                            listOfItems: listOfItems,
                                          );

                                        case 'checkbox':
                                          List<String> listOfItems = [];
                                          item?.propertyOptions?.forEach((element) {
                                            listOfItems.add(element.name??'');
                                          });
                                          return  Column(
                                            children: [
                                              CustomDropDown(
                                                value: item?.radio,
                                                label: item?.label??'',
                                                hint: item?.placeholder??'tanlang',
                                                onChanged: (value) {
                                                  controller.groupProperties?[index].
                                                  properties?[ind].checkBox.addIf(
                                                      !(controller.groupProperties?[index].
                                                      properties?[ind].checkBox.contains(value)??true),
                                                      value??'');
                                                  controller.update();
                                                },
                                                listOfItems: listOfItems,
                                              ),
                                              Visibility(
                                                  visible: item?.checkBox.isNotEmpty??false,
                                                  child:const SizedBox(height: 6)),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Wrap(children: [
                                                  for(int i =0 ; i < (item?.checkBox.length??0) ; i++)
                                                    Container(
                                                      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                                                      margin: EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: AppColors.black3,width: 1),
                                                          borderRadius: BorderRadius.circular(4)
                                                      ),
                                                      child: Text(item?.propertyOptions?[i].name??''),
                                                    )
                                                ],),
                                              ),
                                            ],
                                          );

                                        case 'boolean':
                                         return CustomSwitchWidget(
                                              text: item?.label??'',
                                           onChanged: (value){
                                             controller.groupProperties?[index].
                                             properties?[ind].switchType=value;
                                           },
                                           value: item?.switchType??false,
                                          );

                                        case 'string':
                                          return CustomTextField(
                                            labelText: item?.label??'',
                                            hintText: item?.placeholder??'',
                                            keyboardType: TextInputType.text,
                                            errorText: 'Обязательное поле',
                                            showError:  controller.groupProperties?[index].
                                            properties?[ind].isRequiredDone,
                                            onChanged: (value){
                                              controller.groupProperties?[index].
                                              properties?[ind].input=value;
                                             /* if(item?.isRequired??false){
                                                controller.groupProperties?[index].
                                                properties?[ind].isRequiredDone = value.isNotEmpty;
                                                controller.update();
                                              }*/
                                            },
                                            controller: TextEditingController(text: item?.input),
                                            labelColor: AppColors.black,
                                          );

                                      case 'textarea':
                                        return  CustomTextField(
                                          maxLine: 4,
                                          borderColor: AppColors.border,
                                          controller: TextEditingController(text: item?.textArea),
                                          errorText: 'Обязательное поле',
                                          showError:  controller.groupProperties?[index].properties?[ind].isRequiredDone,
                                          labelText: item?.label??'',
                                          hintText: item?.placeholder??'',
                                          onChanged: (value){
                                            controller.groupProperties?[index].
                                            properties?[ind].textArea=value;
                                           /* if(item?.isRequired??false){
                                              controller.groupProperties?[index].
                                              properties?[ind].isRequiredDone = value.isNotEmpty;
                                              controller.update();
                                            }*/
                                          },
                                          labelColor: AppColors.black,
                                        );

                                        case 'number':
                                          return CustomTextField(
                                            labelText: item?.label??'',
                                            hintText: item?.placeholder??'',
                                            keyboardType: TextInputType.number,
                                            errorText: 'Обязательное поле',
                                            showError:  controller.groupProperties?[index].properties?[ind].isRequiredDone,
                                            onChanged: (value){
                                              controller.groupProperties?[index].
                                              properties?[ind].inputNumber=value;
                                             /* if(item?.isRequired??false){
                                                controller.groupProperties?[index].
                                                properties?[ind].isRequiredDone = value.isNotEmpty;
                                                controller.update();
                                              }*/
                                            },
                                            controller: TextEditingController(text: item?.inputNumber),
                                            labelColor: AppColors.black,
                                          );

                                        case 'date':
                                          return Container(
                                            margin: const EdgeInsets.symmetric(vertical: 12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: AppColors.lightGrey,
                                                  width: 2
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: (){
                                                selectDate(context);
                                                controller.groupProperties?[index].
                                                properties?[ind].date=controller.birthDate;
                                              },
                                              child:  Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                                                  child: Row(
                                                    children: [
                                                      Expanded(child:
                                                      Text(
                                                          DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.birthDate)))),
                                                      const Icon(CupertinoIcons.calendar,size: 20,color: AppColors.black3)
                                                    ],
                                                  )),
                                            ),
                                          );

                                        case 'file':
                                          return FileChooseWidget(
                                            onTap: (){
                                              controller.uploadFile();
                                              controller.groupProperties?[index].
                                              properties?[ind].fileName=controller.fileName;
                                              controller.groupProperties?[index].
                                              properties?[ind].fileUrl=controller.fileUploadResponse?.filePath??'';
                                            },
                                            fileName: controller.fileName,
                                          );

                                        case 'map':
                                          if(mapEnterData!=null){
                                            controller.groupProperties?[index].
                                            properties?[ind].pointMapList =mapEnterData?.pointList??[];
                                            controller.textAreaQuantityController.text = (mapEnterData?.area??0).toString();
                                          }
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                               Text(
                                                item?.label??'',
                                                //'Карта',
                                                style: AppTextStyles.applicationTime,
                                              ),
                                              const SizedBox(height: 12),
                                              InkWell(
                                                onTap: mapEnterData!=null?(){} : () async {
                                                  MapReturnData mapData = await Get.toNamed(Routes.GOOGLE_MAP,
                                                      arguments:  MapEnterData(
                                                          fromWhichPage: 'from_application',
                                                          pointList: controller.groupProperties?[index].
                                                          properties?[ind].pointMapList??[]
                                                      ));
                                                  if(mapData.pointList.isNotEmpty){
                                                    controller.setPointList(mapData.pointList);
                                                    controller.groupProperties?[index].
                                                    properties?[ind].pointMapList = mapData.pointList;
                                                  }
                                                  controller.textAreaQuantityController.text=mapData.area.toString();
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
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: CustomTextField(
                                                        labelColor: AppColors.black,
                                                        labelText: item?.label??'',
                                                        keyboardType: TextInputType.numberWithOptions(),
                                                        readOnly: true,
                                                        enabled: false,
                                                        controller: controller.textAreaQuantityController,
                                                        onChanged: (value){
                                                          controller.groupProperties?[index].
                                                          properties?[ind].map = value;
                                                        },
                                                        hintText: item?.placeholder??'',
                                                        // hintText: 'Введите cотик m2',
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
                      const SizedBox(height: 12),
                      Text('photo_of_place'.tr,style: AppTextStyles.filter),
                      const SizedBox(height: 12),
                      Wrap(children: [
                        for(int i=0 ;i<controller.listOfPhotos.length;i++)
                          CustomCachedNetworkImage(
                              onTap: (){
                                controller.removePhoto(controller.listOfPhotos[i]);
                              },
                              imageUrl: controller.listOfPhotos[i]),
                        AddPhotoButton(
                          onTap: (){
                            controller.uploadPhoto();
                          },
                        )
                      ],)
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
                  Get.back();
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
    var selectedDate = DateTime.parse(controller.birthDate);
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        DateTime? tempPickedDate;
        return Container(
          height: 300,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius:
              BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16))),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    initialDateTime:selectedDate,
                    minimumDate:  DateTime(1940, 01, 01),
                    minimumYear: 1940,
                    maximumYear: DateTime.now().year,
                    maximumDate: DateTime.now(),
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
                    Get.back(result: tempPickedDate);
                  },
                  child:const Text(
                    'Выбрать',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      controller.birthDate = selectedDate.toString();
      controller.update();
    }
  }
}
