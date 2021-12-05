
import 'package:dio/dio.dart';
import 'package:e_space_mobile/base/base_repository.dart';
import 'package:e_space_mobile/data/provider/api_client.dart';
import 'package:e_space_mobile/data/provider/server_error.dart';

class AreaRepository extends BaseRepository{
  ApiClient? _apiClient;

  AreaRepository(){
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

  Future<dynamic> getAllStatuses(int page,int limit) async {
    var response;
    try{
      response = await _apiClient?.getAllStatuses(page,limit);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

}