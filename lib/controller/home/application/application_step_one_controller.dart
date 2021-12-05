import 'dart:convert';
import 'dart:io';
import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/models/home/application/application_address.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/data/models/home/file_upload/photo_upload_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/city_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/district_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/village_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/steps/steps_model_response.dart';
import 'package:e_space_mobile/data/repository/home_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_space_mobile/data/models/home/file_upload/file_upload_response.dart';

import 'application_controller.dart';

class ApplicationStepOneController extends BaseController {
  HomeRepository? _homeRepository;

  ApplicationStepOneController() {
    _homeRepository = HomeRepository();
  }

  List<LatLng> _pointList = [];
  List<LatLng> get pointList => _pointList;

  //viloyat
  List<Cities> _cities = [];
  List<Cities> get cities => _cities;
  List<String> citiesName = [];
  Cities? _selectedCity;
  Cities? get selectedCity => _selectedCity;

  //tuman
  List<Regions> _regions = [];
  List<Regions> get regions => _regions;
  List<String> regionsName = [];
  Regions? _selectedRegion;
  Regions? get selectedRegion => _selectedRegion;

  // mahalla
  List<Districts> _districts = [];
  List<Districts> get districts => _districts;
  List<String> districtsName = [];
  Districts? _selectedDistrict;
  Districts? get selectedDistrict => _selectedDistrict;

  List<GroupProperties>? _groupProperties = [];
  List<GroupProperties>? get groupProperties => _groupProperties;

  ApplicationAddress? _address = new ApplicationAddress();
  final ImagePicker _picker = ImagePicker();
  PhotoUploadResponse? _photoUploadResponse;
  PhotoUploadResponse? get photoUploadResponse => _photoUploadResponse;
  List<String> _listOfPhotos = [];
  List<String> get listOfPhotos => _listOfPhotos;

  TextEditingController textMoreAddressController = TextEditingController();
  TextEditingController textAreaQuantityController = TextEditingController();
  RxBool _isInputEnable = false.obs;
  bool get isInputEnable => _isInputEnable.value;
  String birthDate = DateTime.now().toString();

  FileUploadResponse? _fileUploadResponse;
  FileUploadResponse? get fileUploadResponse => _fileUploadResponse;
  String fileName = '';

  setIsInputEnable() {
    _isInputEnable.value = !_isInputEnable.value;
  }

  setPointList(List<LatLng> pointList) {
    _pointList = pointList;
  }

  Future<void> getCities() async {
    setLoading(true);
    var response = await _homeRepository?.getCities();
    setLoading(false);
    if (response is CityModelResponse) {
      _cities = response.cities ?? [];
      citiesName.clear();
      if (_cities.isNotEmpty)
        _cities.forEach((element) {
          citiesName.add(element.name ?? '');
        });
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getDistricts(String cityId) async {
    setLoading(true);
    var response = await _homeRepository?.getDistricts(cityId);
    setLoading(false);
    if (response is DistrictModelResponse) {
      _regions = response.regions ?? [];
      regionsName.clear();
      _regions.forEach((element) {
        regionsName.add(element.name ?? '');
      });
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getVillages(String cityId, String districtId) async {
    setLoading(true);
    var response = await _homeRepository?.getVillages(cityId, districtId);
    setLoading(false);
    if (response is VillageModelResponse) {
      _districts = response.districts ?? [];
      districtsName.clear();
      _districts.forEach((element) {
        districtsName.add(element.name ?? '');
      });
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getOneSuggestion(int step, int type) async {
    setLoading(true);
    var response = await _homeRepository?.getSuggestionSteps(step, type);
    setLoading(false);
    if (response is StepsModelResponse) {
      _groupProperties = response.groupProperties ?? [];
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<PhotoUploadResponse?> uploadPhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (photo == null) return null;
    final dir = await getTemporaryDirectory();
    final targetPath = "${dir.absolute.path}/temp.jpg";
    File file = File(photo.path);
    File? compressFile = await compressAndGetFile(file, targetPath);
    //server upload;
    setLoading(true);
    var response = await _homeRepository?.uploadPhoto(
      compressFile ?? file,
      'multipart/form-data',
    );
    setLoading(false);
    if (response is PhotoUploadResponse) {
      _photoUploadResponse = response;
      _listOfPhotos.add(response.filePath ?? '');
      update();
    } else {
      showErrorMessage(response.toString());
    }
    return photoUploadResponse;
  }

  void isNext() async {
    if (_selectedCity == null) {
      Get.snackbar('warnings'.tr, 'select_area'.tr);
      return ;
    }
    if (_selectedRegion == null) {
      Get.snackbar('warnings'.tr, 'select_district'.tr);
      return;
    }
    if (_selectedDistrict == null) {
      Get.snackbar('warnings'.tr, 'select_village'.tr);
      return;
    }
    bool isNext = true;
    String requiredText ='';
    _groupProperties?.forEach((element) {
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
      Get.find<ApplicationController>().setIndex(1);
    } else
      Get.snackbar('warnings'.tr, '$requiredText ${'required_field'.tr}');
  }

  bool getAnswer(Properties itemData) {
    switch (itemData.type) {
      case 'number':
        return itemData.inputNumber != null;
      case 'string':
        return itemData.input != null;
      case 'textarea':
        return itemData.textArea != null;
      case 'boolean':
        return itemData.switchType != null;
      case 'date':
        return itemData.date != null;
      case 'file':
        return itemData.fileUrl != null;
      case 'map':
        return itemData.pointMapList.isNotEmpty;
      case 'radio':
        return itemData.radio != null;
      case 'checkbox':
        return itemData.checkBox.isNotEmpty;
    }
    return false;
  }

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileName = result.files.first.name;
      File file = File(result.files.single.path ?? '');
      setLoading(true);
      var response = await _homeRepository?.uploadFile(
        file,
        'multipart/form-data',
      );
      setLoading(false); //FileUploadResponse
      if (response is FileUploadResponse) {
        _fileUploadResponse = response;
        update();
      } else {
        showErrorMessage(response.toString());
      }
    }
  }

  Future<Directory> getTemporaryDirectory() async {
    return Directory.systemTemp;
  }

  Future<File?> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 60,
        minWidth: 512,
        minHeight: 512,
        format: CompressFormat.jpeg);
    return result;
  }

  removePhoto(String value) {
    _listOfPhotos.remove(value);
    update();
  }

  void setEntity(Entities? entities) {
    _selectedCity = Cities(
        id: entities?.city?.id ?? '',
        name: entities?.city?.name,
        ruName: entities?.city?.ruName,
        soato: entities?.city?.soato ?? 0,
        code: entities?.city?.code ?? 0);
    _selectedRegion = Regions(
        id: entities?.region?.id ?? '',
        name: entities?.region?.name ?? '',
        ruName: entities?.region?.ruName,
        soato: entities?.region?.soato ?? 0,
        code: entities?.region?.code ?? 0);
    _selectedDistrict = Districts(
        id: entities?.district?.id ?? '',
        name: entities?.district?.name ?? '',
        ruName: entities?.district?.ruName ?? '',
        soato: entities?.district?.soato ?? 0,
        code: entities?.district?.code ?? 0);
    String cordinatesId = '6113589b73bf6fe15aaef566'; // cordinatalar
    String areaId = '611359b073bf6fe15aaef568'; //yuza
    String gaSotixId = '60ee8a5ec30b719d5f4e4686'; //yuza
    String inputAreaID = '61262714c155e351a31692d9'; //yuza
    String mapId = '60ee8a78c30b719d5f4e4687'; //cordi

    for (int i = 0; i < (_groupProperties?.length ?? 0); i++)
      for (int j = 0; j < (_groupProperties?[i].properties?.length ?? 0); j++) {
        /*
      var itemData = _groupProperties?[i].properties?[j];
      String id = itemData?.id??'';
      String value = entities?.entityProperties?.singleWhere((item) =>
      (item.propertyId == id)).value??'';

      switch (itemData?.type??'') {
        case 'number':
           _groupProperties?[i].properties?[j].inputNumber = value;
           break;
        case 'string':
          _groupProperties?[i].properties?[j].input = value;
          break;
        case 'textarea':
          _groupProperties?[i].properties?[j].textArea = value;
          break;
        case 'date':
          _groupProperties?[i].properties?[j].date = value;
          break;
        case 'map':
          _groupProperties?[i].properties?[j].map = value;
          break;
      }*/

        if (_groupProperties?[i].properties?[j].id == cordinatesId ||
            _groupProperties?[i].properties?[j].id == mapId) {
          // cordinats
          _groupProperties?[i]
              .properties?[j]
              .pointMapList = stringToLatLng(entities?.entityProperties
                  ?.singleWhere((item) => (item.propertyId == cordinatesId ||
                      item.propertyId == mapId))
                  .value ??
              '');
        } else if (_groupProperties?[i].properties?[j].id == areaId ||
            _groupProperties?[i].properties?[j].id == gaSotixId ||
            _groupProperties?[i].properties?[j].id == inputAreaID) {
          // area of surface place
          textAreaQuantityController.text = entities?.entityProperties
                  ?.singleWhere((item) => (item.propertyId == areaId ||
                      item.propertyId == gaSotixId ||
                      item.propertyId == inputAreaID))
                  .value ??
              '';
          _groupProperties?[i].properties?[j].map = entities?.entityProperties
                  ?.singleWhere((item) => (item.propertyId == areaId ||
                      item.propertyId == gaSotixId ||
                      item.propertyId == inputAreaID))
                  .value ??
              '';
          _groupProperties?[i].properties?[j].input = entities?.entityProperties
                  ?.singleWhere((item) => (item.propertyId == areaId ||
                      item.propertyId == gaSotixId ||
                      item.propertyId == inputAreaID))
                  .value ??
              '';
          _groupProperties?[i].properties?[j].inputNumber = entities
                  ?.entityProperties
                  ?.singleWhere((item) => (item.propertyId == areaId ||
                      item.propertyId == gaSotixId ||
                      item.propertyId == inputAreaID))
                  .value ??
              '';
        }
      }
  }

  List<LatLng> stringToLatLng(String value) {
    List<LatLng> latLang = [];
    List<dynamic> list = json.decode(value);
    list.first.forEach((data) {
      latLang.add(LatLng(
          double.parse(data[1].toString()), double.parse(data[0].toString())));
    });
    return latLang;
  }

  //mahalla
  setQuarter(String? value) {
    _address?.quarter = value;
    update();
    _districts.forEach((element) {
      if (element.name == value) _selectedDistrict = element;
    });
  }

  // tuman
  setDistrict(String? value) async {
    _address?.district = value;
    _address?.quarter = null;
    update();
    _regions.forEach((element) {
      if (element.name == value) _selectedRegion = element;
    });
    await getVillages(_selectedCity?.id ?? '', _selectedRegion?.id ?? '');
  }

  // viloyat
  setRegion(String? value) async {
    _address?.region = value;
    _address?.district = null;
    _address?.quarter = null;
    update();
    _cities.forEach((element) {
      if (element.name == value) {
        _selectedCity = element;
      }
    });
    await getDistricts(_selectedCity?.id ?? '');
  }

  String? get landMark => _address?.landMark;

  String? get fullAddress => _address?.fullAddress;

  String? get quarter => _address?.quarter;

  String? get district => _address?.district;

  String? get region => _address?.region;
}
