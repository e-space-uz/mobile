
import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/models/area/actions/entity_action_history.dart';
import 'package:e_space_mobile/data/models/area/single_entity/single_entity_model.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/entity_applicants_response.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/single_entity_draft_response.dart';
import 'package:e_space_mobile/data/repository/profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyApplicationDetailsController extends BaseController {
  ProfileRepository? _profileRepository ;

  MyApplicationDetailsController(){
    _profileRepository = ProfileRepository();
  }

  String _entityDraftId = Get.arguments;
  String _entityId = '';

  final PageController pageController = PageController(initialPage: 0);

  PAGE_INDEX _pageIndex = PAGE_INDEX.FIRST;
  PAGE_INDEX get pageIndex=>_pageIndex;

  SingleEntityModel? _singleEntityModel;
  SingleEntityModel? get singleEntityModel=> _singleEntityModel;

  List<ActionHistories> _actionHistories = [];
  List<ActionHistories> get actionHistories => _actionHistories;

  SingleEntityDraftResponse? _singleEntityDraft;
  SingleEntityDraftResponse? get singleEntityDraft => _singleEntityDraft;

  List<EntityDrafts> _entityDraftsApplicants = [];
  List<EntityDrafts> get entityDraftsApplicants => _entityDraftsApplicants ;

  onReady() async {
    super.onReady();
    // await getSingleEntity();
    await getSingleEntityDraft();
    await getActionsHistory();
    await getSingleEntityApplicants();

  }

  setPageIndex(int index){
    _pageIndex = PAGE_INDEX.values[index];
    update();
  }

  // Future<void> getSingleEntity() async {
  //   setLoading(true);
  //   var response = await _profileRepository?.getSingleEntity(_entityId);
  //   setLoading(false);
  //   if(response is SingleEntityModel){
  //     _singleEntityModel = response;
  //     update();
  //   }else{
  //     showErrorMessage(response.toString());
  //   }
  // }


  Future<void> getSingleEntityApplicants() async {
    if(_entityId.isEmpty) return;
    setLoading(true);
    var response = await _profileRepository?.getEntityApplicants(_entityId);
    setLoading(false);
    if(response is EntityApplicantsResponse){
      _entityDraftsApplicants = response.entityDrafts??[];
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> getSingleEntityDraft() async {
    setLoading(true);
    var response = await _profileRepository?.getSingleEntityDraft(
    localSource.getAccessToken(),
        _entityDraftId);
    setLoading(false);
    if(response is SingleEntityDraftResponse){
      _singleEntityDraft = response;
      _entityId = _singleEntityDraft?.entity?.id??'';
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> getActionsHistory() async {
    String id = _singleEntityDraft?.entity?.id??'';
    if(id.isEmpty){return;}
    setLoading(true);
    var response = await _profileRepository?.getActionHistory(id);
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