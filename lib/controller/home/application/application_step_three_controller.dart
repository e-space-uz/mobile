import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/controller/home/application/application_step_two_controller.dart';
import 'package:e_space_mobile/controller/map/main_map_controller.dart';
import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';
import 'package:e_space_mobile/data/models/home/map_values/map_values.dart';
import 'package:e_space_mobile/data/models/home/suggestion/steps/steps_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/suggestion_model_response.dart';
import 'package:e_space_mobile/data/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'application_step_one_controller.dart';

class ApplicationStepThreeController extends BaseController {
  HomeRepository? _homeRepository;

  ApplicationStepThreeController() {
    _homeRepository = HomeRepository();
  }

  final profileController = Get.find<MainProfileController>();
  final firstStepController = Get.find<ApplicationStepOneController>();
  final secondStepController = Get.find<ApplicationStepTwoController>();

   TextEditingController textFIOController = TextEditingController();
   TextEditingController textNumberController = TextEditingController();

  List<LatLng> _pointList = [];
  List<LatLng> get pointList => _pointList;

  @override
  void onInit() {
    super.onInit();
    // applicant details set
    textFIOController.text =
        '${profileController.profileResponse?.lastName ?? ''} '
        '${profileController.profileResponse?.firstName ?? ''}';
    textNumberController.text =
        profileController.profileResponse?.phoneNumber ?? '';
  }

  //  taklif yaratadi , create offer
  Future<bool> createEntityDraft() async {
    List<EntityPropertyModel> listOfProperty = [];
    for (int i = 0; i < (firstStepController.groupProperties?.length ?? 0); i++) {
      firstStepController.groupProperties?[i].properties?.forEach((element) {
        listOfProperty.add(EntityPropertyModel(
          value: getAnswer(element),
          propertyId: element.id,
        ));
      });
    }
    secondStepController.groupProperties.forEach((element) {
      element.properties?.forEach((itemData) {
        listOfProperty.add(EntityPropertyModel(
          value: getAnswer(itemData),
          propertyId: itemData.id,
        ));
      });
    });

    EntityCreateRequest request = EntityCreateRequest(
        city: firstStepController.selectedCity,
        comment: '',
        district: firstStepController.selectedDistrict,
        entityGallery: firstStepController.listOfPhotos,
        entityProperties: listOfProperty,
        region: firstStepController.selectedRegion);
    setLoading(true);
    var response = await _homeRepository?.createEntityDraft(
        localSource.getAccessToken(), request);
    setLoading(false);
    if (response is SuggestionModelResponse) {
      return true;
    } else {
      showErrorMessage(response.toString());
    }
    return false;
  }

  String getLabelText(Properties? itemData) {
    String value = '';
    switch (itemData?.type ?? '') {
      case 'number':
        value = itemData?.inputNumber ?? '-';
        break;
      case 'string':
        value = itemData?.input ?? '-';
        break;
      case 'textarea':
        value = itemData?.textArea ?? '-';
        break;
      case 'boolean':
        if (itemData?.switchType ?? false)
          value = 'Ha';
        else
          value = 'Yo\'q';
        break;
      case 'date':
        if ((itemData?.date?.isNotEmpty ?? false) && (itemData?.date != null))
          value = DateFormat('dd.MM.yyyy')
              .format(DateTime.parse(itemData?.date ?? ''));
        else value = '-';
        break;
      case 'file':
        value = itemData?.fileName ?? '-';
        break;
      case 'radio':
        value = itemData?.radio ?? '-';
        break;
      case 'map':
        // _pointList.addAll(itemData?.pointMapList??[]);
        setPoints(itemData?.pointMapList ?? []);
        value = itemData?.map ?? '-';
        break;
      case 'checkbox':
        itemData?.checkBox.forEach((element) {
          value = value + element + ',';
        });
        break;
    }
    return value;
  }

  // get answer by type
  String getAnswer(Properties itemData) {
    String value = '';
    switch (itemData.type) {
      case 'number':
        value = itemData.inputNumber ?? '';
        break;
      case 'string':
        value = itemData.input ?? '';
        break;
      case 'textarea':
        value = itemData.textArea ?? '';
        break;
      case 'boolean':
        if (itemData.switchType ?? false)
          value = 'true';
        else
          value = 'false';
        break;
      case 'date':
        if ((itemData.date?.isNotEmpty ?? false) && (itemData.date != null))
          value = DateFormat('dd.MM.yyyy')
            .format(DateTime.parse(itemData.date ?? ''));
        break;
      case 'file':
        value = itemData.fileUrl ?? '';
        break;
      case 'map':
        MapDataProperties mapValues = MapDataProperties();
        Geometry geometry = Geometry();
        List<List<String>> listOfCor = [];
        itemData.pointMapList.forEach((element) {
          List<String> list = [
            element.longitude.toString(),
            element.latitude.toString()
          ];
          listOfCor.add(list);
        });
        geometry.coordinates = [listOfCor];
        mapValues.geometry = geometry;
        value = mapValues.toJson()['geometry']['coordinates'].toString();
        break;
      case 'radio':
        itemData.propertyOptions?.forEach((element) {
          if (element.name == (itemData.radio ?? ''))
            value = element.value ?? '';
          return;
        });
        // value = itemData.radio??'';
        break;
      case 'checkbox':
        // String values = '';
        itemData.propertyOptions?.forEach((element) {
          if (itemData.checkBox.contains(element.name)) {
            value = value + (element.value ?? '');
          }
          return;
        });
        break;
    }
    return value;
  }

  void setPoints(List<LatLng> pointList) {
    _pointList.addAll(pointList);
  }
}
