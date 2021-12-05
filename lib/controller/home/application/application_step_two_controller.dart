import 'dart:io';

import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/models/home/application/construction_type_response.dart';
import 'package:e_space_mobile/data/models/home/file_upload/file_upload_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/steps/steps_model_response.dart';
import 'package:e_space_mobile/data/repository/home_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'application_controller.dart';

class ApplicationStepTwoController extends BaseController {
  HomeRepository? _homeRepository;

  ApplicationStepTwoController(){
    _homeRepository = HomeRepository();
  }

  String? _type;
  String? get type => _type;
  FileUploadResponse? _fileUploadResponse;
  FileUploadResponse? get fileUploadResponse => _fileUploadResponse;
  String fileName = '';
  String birthDate = '';
  int _page = 1;
  int _limit = 100;
  String objectTypeId = '60f162a61cf5362a1aac9782';

  List<GroupProperties> _groupProperties = [];
  List<GroupProperties> get groupProperties => _groupProperties;
  List<String> listOfPlacesType = [];
  PropertyOptions? _selectedPropertyOptions;
  PropertyOptions? get selectedPropertyOptions => _selectedPropertyOptions;
  final TextEditingController textMoreInformationController = TextEditingController();
  final TextEditingController textInvestPriceController = TextEditingController();
  final TextEditingController textWorkPlaceController = TextEditingController();
  final TextEditingController textAreaQuantityController = TextEditingController();
  RxBool _isInputEnable = false.obs;
  bool get isInputEnable => _isInputEnable.value;

  List<ConstructionTypes> _constructionTypes = [];
  List<String> constructionTypesNames = [];
  List<ConstructionTypes> get  constructionTypes => _constructionTypes;

  onReady() async {
    super.onReady();
    await getConstructionTypes();
    await getTwoSuggestion(2, 4);
  }

  Future<void> getTwoSuggestion(int step,int type) async {
    setLoading(true);
    var response = await _homeRepository?.getSuggestionSteps(step,type);
    setLoading(false);
    if(response is StepsModelResponse){
      _groupProperties = response.groupProperties??[];
      _groupProperties.first.properties?.first.propertyOptions?.forEach((element) {
        listOfPlacesType.add(element.name??'');
      });
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> getConstructionTypes() async {
    setLoading(true);
    var response = await _homeRepository?.getConstructionType(_page,_limit);
    setLoading(false);
    if(response is ConstructionTypeResponse){
      _constructionTypes = response.constructionTypes??[];
      _constructionTypes.forEach((element) {
        constructionTypesNames.add(element.name??'');
      });
      update();
    }
    else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null) {
       fileName = result.files.first.name;
      File file = File(result.files.single.path??'');
      setLoading(true);
      var response = await _homeRepository?.uploadFile(
          file,
          'multipart/form-data',
      );
       setLoading(false);//FileUploadResponse
       if(response is FileUploadResponse){
        _fileUploadResponse = response;
        update();
      }
      else{
        showErrorMessage(response.toString());
      }
    }
  }

 /* bool isNext(){
    bool isNext = true;
    _groupProperties.forEach((element) {
      element.properties?.forEach((element) {
        if(element.isRequired??false){
          isNext = isNext && getAnswer(element);
        }
      });
    });
    return isNext;
  }*/

  void isNext() {
    bool isNext = true;
    String requiredText ='';
    _groupProperties.forEach((element) {
      element.properties?.forEach((item) {
        if (item.isRequired ?? false) {
          isNext = isNext && getAnswer(item);
          if (!getAnswer(item)) {
            Get.snackbar('warnings'.tr, '${item.label??''} ${'required_field'.tr}');
            isNext =false;
            requiredText = item.label??'';
            return;
          }
        }
      });
    });
    if (isNext) {
      Get.find<ApplicationController>().setIndex(2);
    } else
      Get.snackbar('warnings'.tr, '$requiredText ${'required_field'.tr}');
  }

  bool getAnswer(Properties itemData) {
    switch (itemData.type){
      case 'number':  return itemData.inputNumber!=null;
      case 'string': return itemData.input!=null;
      case 'textarea': return itemData.textArea!=null;
      case 'boolean': return itemData.switchType!=null;
      case 'date': return itemData.date!=null;
      case 'file': return itemData.fileUrl!=null;
      case 'map': return itemData.pointMapList.isNotEmpty;
      case 'radio': return itemData.radio !=null;
      case 'checkbox': return itemData.checkBox.isNotEmpty;
    }
    return false;
  }

  setIsInputEnable(){
    _isInputEnable.value = !_isInputEnable.value;
  }

  setType(String? value) {
    _type = value;
    _groupProperties.first.properties?.first.propertyOptions?.forEach((element) {
      if(value==element.name)
        _selectedPropertyOptions = element;
    });
    update();
  }
}
