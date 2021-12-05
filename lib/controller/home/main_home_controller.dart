import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/controller/profile/main_profile_controller.dart';
import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:e_space_mobile/data/models/auth/token_response.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/data/models/home/entity/news_response.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/entity_draft_model.dart';
import 'package:e_space_mobile/data/repository/home_repository.dart';
import 'package:e_space_mobile/data/repository/profile_repository.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:get/get.dart';

class MainHomeController extends BaseController {
  ProfileRepository? _profileRepository;
  HomeRepository? _homeRepository;

  MainHomeController() {
    _homeRepository = HomeRepository();
    _profileRepository = ProfileRepository();
  }

  int _page = 1;
  int _limit = 10;
  List<Entities> _entities = [];
  List<News> _news = [];

  List<Entities> get entities => _entities;
  List<News> get news => _news;
  List<EntityDraft> _entitiesDraft = [];

  List<EntityDraft> get entitiesDraft => _entitiesDraft;

  onReady() async {
    super.onReady();
    if (LocalSource.getInstance().hasProfile())
      getEntityDraft();
    getNews();
    getEntity();
  }

  Future<void> checkAuthWithOneId() async {
    if (localSource.hasProfile()) {
      Get.toNamed(Routes.APPLICATION);
    } else {
      String code = await Get.toNamed(Routes.WEB_VIEW);
      if (code.isNotEmpty) {
        getTokens(code);
      }
    }
  }

  Future<bool> checkAuth() async {
    if (localSource.hasProfile()) {
      return true;
    } else {
      String code = await Get.toNamed(Routes.WEB_VIEW);
      if (code.isNotEmpty) {
        var res = await getTokensForResult(code);
        return res;
      }
      return false;
    }
  }

  Future<void> getEntityDraft() async {
    if (_page == 1) setLoading(true);
    var response = await _profileRepository?.getEntityDraft(localSource.getAccessToken(), _page, _limit);
    setLoading(false);
    if (response is EntityDraftModel) {
      _entitiesDraft = response.entityDrafts ?? [];
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getEntity() async {
    print('RRRRRRRRRRRRRRRRR :${localSource.getRefreshToken()}');
    setLoading(true);
    var response = await _homeRepository?.getEntity(_page, _limit);
    setLoading(false);
    if (response is EntityModelResponse) {
      _entities = response.entities ?? [];
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getNews() async {
    print('RRRRRRRRRRRRRRRRR :${localSource.getRefreshToken()}');
    setLoading(true);
    var response = await _homeRepository?.getNews();
    setLoading(false);
    if (response is NewsResponse) {
      _news = response.news ?? [];
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }


  Future<void> getTokens(String code) async {
    var response = await _homeRepository?.getTokens(code);
    if (response is TokenResponse) {
      localSource.setTokens(response.accessToken ?? '', response.refreshToken ?? '');
      localSource.setProfileHas(true);
      await Get.find<MainProfileController>().getProfileDetails();
      Get.toNamed(Routes.APPLICATION);
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<bool> getTokensForResult(String code) async {
    var response = await _homeRepository?.getTokens(code);
    if (response is TokenResponse) {
      localSource.setTokens(response.accessToken ?? '', response.refreshToken ?? '');
      localSource.setProfileHas(true);
      await Get.find<MainProfileController>().getProfileDetails();
      return true;
    } else {
      showErrorMessage(response.toString());
    }
    return false;
  }
}
