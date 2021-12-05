
import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/models/area/actions/entity_action_history.dart';
import 'package:e_space_mobile/data/models/area/single_entity/single_entity_model.dart';
import 'package:e_space_mobile/data/repository/area_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApplicationDetailsController extends BaseController{
  AreaRepository? _areaRepository ;
  ApplicationDetailsController(){
    _areaRepository = AreaRepository();
  }

  String _entityId = Get.arguments;

  final PageController pageController = PageController(initialPage: 0);

  PAGE_INDEX _pageIndex = PAGE_INDEX.FIRST;
  PAGE_INDEX get pageIndex=>_pageIndex;

  SingleEntityModel? _singleEntityModel;
  SingleEntityModel? get singleEntityModel=> _singleEntityModel;

  List<ActionHistories> _actionHistories = [];
  List<ActionHistories> get actionHistories => _actionHistories;

  ///TODO add url launcher libs to ios
  onReady() async {
    super.onReady();
    await getSingleEntity();
    await getActionsHistory();
  }
  setPageIndex(int index){
    _pageIndex = PAGE_INDEX.values[index];
    update();
  }

  Future<void> getSingleEntity() async {
    setLoading(true);
    var response = await _areaRepository?.getSingleEntity(_entityId);
    setLoading(false);
    if(response is SingleEntityModel){
      _singleEntityModel = response;
      _singleEntityModel?.entityProperties?.removeWhere(
              (element) => element.property?.id=='6113590973bf6fe15aaef567');
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> getActionsHistory() async {
    setLoading(true);
    var response = await _areaRepository?.getActionHistory(_entityId);
    setLoading(false);
    if(response is EntityActionHistory){
      _actionHistories = response.actionHistories??[];
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

}

enum PAGE_INDEX {
  FIRST,
  SECOND
}