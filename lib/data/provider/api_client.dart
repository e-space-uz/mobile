import 'dart:io';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:e_space_mobile/base/base_functions.dart';
import 'package:e_space_mobile/core/constants/constants.dart';
import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:e_space_mobile/data/models/area/actions/entity_action_history.dart';
import 'package:e_space_mobile/data/models/area/single_entity/single_entity_model.dart';
import 'package:e_space_mobile/data/models/area/statuses/statuses_response.dart';
import 'package:e_space_mobile/data/models/auth/refresh_token_response.dart';
import 'package:e_space_mobile/data/models/auth/token_response.dart';
import 'package:e_space_mobile/data/models/home/application/construction_type_response.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_count.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/data/models/home/entity/news_response.dart';
import 'package:e_space_mobile/data/models/home/file_upload/file_upload_response.dart';
import 'package:e_space_mobile/data/models/home/file_upload/photo_upload_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/city_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/district_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/village_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/steps/steps_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/suggestion_model_response.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/entity_applicants_response.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/entity_draft_model.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/single_entity_draft_response.dart';
import 'package:e_space_mobile/data/models/profile/profile_info/profile_response.dart';
import 'package:e_space_mobile/ui/main/internet_connection/internet_connection_page.dart';
import 'package:get/get.dart' as GetX;
import 'package:alice/alice.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class ApiClient {
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));
    // dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        toNoInternetPageNavigator: () async =>
            await GetX.Get.to(InternetConnectionPage()),
        accessTokenGetter: () => LocalSource.getInstance().getAccessToken(),
        refreshTokenFunction: BaseFunctions.refreshToken,
      ),
    );
    dio.interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true, request: true),
    );
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = Constants.BASE_URL}) {
    if (_apiClient != null)
      return _apiClient!;
    else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('applicant/one-id/{code}')
  Future<TokenResponse> getTokens(@Path('code') String code);

  @GET('applicant-by-token')
  Future<ProfileResponse> getProfile(
    @Header('Authorization') String token,
  );

  @GET('action-history-entity/{entity_id}')
  Future<EntityActionHistory> getActionHistory(
    @Path('entity_id') String entityId,
  );

  @GET('entity')
  Future<EntityModelResponse> getEntity(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('entity')
  Future<EntityModelResponse> getEntityByFilter(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('city_id') String cityId,
    @Query('region_id') String regionId,
    @Query('status_id') String statusId,
    @Query('to_date') String date,
  );

  @GET('entity-properties')
  Future<EntityModelResponse> getEntityWithProperties(
    @Query('city_id') String cityId,
    @Query('region_id') String regionId,
    @Query('status_id') String statusId,
  );

  @GET('news')
  Future<NewsResponse> getNews();

  @GET('entity-draft')
  Future<EntityDraftModel> getEntityDraft(
    @Header('Authorization') String token,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('entity/{entity_id}')
  Future<SingleEntityModel> getSingleEntity(
    @Path('entity_id') String id,
  );

  @GET('entity/{entity_id}')
  Future<EntityApplicantsResponse> getEntityApplicants(
      @Path('entity_id') String id,
      );

  @POST('login-refresh')
  Future<RefreshTokenResponse> refreshToken(
    @Query('refresh_token') String rToken,
  );

  @GET('city')
  Future<CityModelResponse> getCities();

  @GET('regions/{city_id}')
  Future<DistrictModelResponse> getDistricts(
    @Path('city_id') String cityId,
  );

  @GET('districts/{city_id}/{region_id}')
  Future<VillageModelResponse> getVillages(
    @Path('city_id') String cityId,
    @Path('region_id') String districtId,
  );

  @GET('group-property-type')
  Future<StepsModelResponse> getSuggestionSteps(
    @Query('step') int step,
    @Query('type') int type,
  );

  @POST('file-upload')
  Future<FileUploadResponse> uploadFile(
    @Header('Content-Type') String contentType,
    @Part() File file,
  );

  @POST('image-upload')
  Future<PhotoUploadResponse> uploadPhoto(
    @Header('Content-Type') String contentType,
    @Part() File file,
  );

  @POST('entity-draft')
  Future<SuggestionModelResponse> createEntityDraft(
    @Header('Authorization') String token,
    @Body() EntityCreateRequest request,
  );

  @GET('status')
  Future<StatusesResponse> getAllStatuses(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('entity-draft/{entity_draft_id}')
  Future<SingleEntityDraftResponse> getSingleEntityDraft(
    @Header('Authorization') String token,
    @Path('entity_draft_id') String id,
  );

  @GET('entity-count')
  Future<EntityCount> getEntityCount();

  @GET('construction-type')
  Future<ConstructionTypeResponse> getConstructionType(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
