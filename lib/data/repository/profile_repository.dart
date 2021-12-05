
import 'package:dio/dio.dart';
import 'package:e_space_mobile/base/base_repository.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';
import 'package:e_space_mobile/data/provider/api_client.dart';
import 'package:e_space_mobile/data/provider/server_error.dart';

class ProfileRepository extends BaseRepository{
  ApiClient? _apiClient;

  ProfileRepository(){
    _apiClient = ApiClient.getInstance();
  }

  Future<dynamic> getEntityDraft(String token,int page, int limit) async {
    var response;
    try{
      response = await _apiClient?.getEntityDraft(token,page,limit);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getSingleEntityDraft(String token,String id) async {
    var response;
    try{
      response = await _apiClient?.getSingleEntityDraft(token,id);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getProfileDetails(String token) async {
    var response;
    try{
      response = await _apiClient?.getProfile(token);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getEntityByFilter(int page, int limit,String cityId,
      String regionId,String statusId,String date) async {
    var response;
    try{
      response = await _apiClient?.getEntityByFilter(
          page,limit,cityId,regionId,statusId,date);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getSingleEntity(String id) async {
    var response;
    try{
      response = await _apiClient?.getSingleEntity(id);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }


  Future<dynamic> getEntityApplicants(String id) async {
    var response;
    try{
      response = await _apiClient?.getEntityApplicants(id);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getActionHistory(String id) async {
    var response;
    try{
      response = await _apiClient?.getActionHistory(id);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

}