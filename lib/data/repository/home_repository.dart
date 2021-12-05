
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_space_mobile/base/base_repository.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_create_request.dart';
import 'package:e_space_mobile/data/provider/api_client.dart';
import 'package:e_space_mobile/data/provider/server_error.dart';

class HomeRepository extends BaseRepository{
  ApiClient? _apiClient;

  HomeRepository(){
    _apiClient = ApiClient.getInstance();
  }

  Future<dynamic> getEntity(int page, int limit) async {
    var response;
    try{
      response = await _apiClient?.getEntity(page,limit);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }


  Future<dynamic> getNews() async {
    var response;
    try{
      response = await _apiClient?.getNews();
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getTokens(String code) async {
    var response;
    try{
      response = await _apiClient?.getTokens(code);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getCities() async {
    var response;
    try{
      response = await _apiClient?.getCities();
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getDistricts(String cityId) async {
    var response;
    try{
      response = await _apiClient?.getDistricts(cityId);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getVillages(String cityId, String districtId) async {
    var response;
    try{
      response = await _apiClient?.getVillages(cityId,districtId);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getSuggestionSteps(int step, int type) async {
    var response;
    try{
      response = await _apiClient?.getSuggestionSteps(step,type);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> uploadPhoto(File file,String contentType) async {
    var response;
    try{
      response = await _apiClient?.uploadPhoto(contentType,file);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> uploadFile(File file,String contentType) async {
    var response;//FileUploadRequest request
    try{
      response = await _apiClient?.uploadFile(contentType,file);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> createEntityDraft(String token,EntityCreateRequest request) async {
    var response;//FileUploadRequest request
    try{
      response = await _apiClient?.createEntityDraft(token,request);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getEntityCount() async {
    var response;
     try{
      response = await _apiClient?.getEntityCount();
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

  Future<dynamic> getConstructionType(int page,int limit) async {
    var response;
    try{
      response = await _apiClient?.getConstructionType(page, limit);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }
}