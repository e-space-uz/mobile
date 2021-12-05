import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/entity_draft_model.dart';
import 'package:e_space_mobile/data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyApplicationController extends BaseController {
  ProfileRepository? _profileRepository;

  MyApplicationController(){
    _profileRepository = ProfileRepository();
  }

  List<EntityDraft> _entitiesDraft = [];

  List<EntityDraft> get entitiesDraft => _entitiesDraft;

  int _page = 1;

  int _limit = 10;

  ScrollController scrollController = ScrollController();
  RxBool isPagingProcess = false.obs;

  onReady() async {
    super.onReady();
    if(LocalSource.getInstance().hasProfile()){
      await getEntityDraft();
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          getEntityDraft();
        }
      });
    }
  }

  Future<void> getEntityDraft() async {
    if(_page==1) setLoading(true);
    else isPagingProcess.value = true;
    var response = await _profileRepository?.getEntityDraft(
        localSource.getAccessToken(),
        _page,
        _limit);
    setLoading(false);
    isPagingProcess.value = false;
    if(response is EntityDraftModel){
      if(_page==1){
        _entitiesDraft = response.entityDrafts??[];
      }else{
        _entitiesDraft.addAll(response.entityDrafts??[]);
      }
      _page++;
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

}
