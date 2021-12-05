
import 'package:dio/dio.dart';
import 'package:e_space_mobile/base/base_repository.dart';
import 'package:e_space_mobile/data/provider/api_client.dart';
import 'package:e_space_mobile/data/provider/server_error.dart';

class MapRepository extends BaseRepository{
  ApiClient? _apiClient;

  MapRepository(){
    _apiClient = ApiClient.getInstance();
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

  Future<dynamic> getEntityWithOptions(
      String cityId, String regionId,String statusId) async {
    var response;
    try{
      response = await _apiClient?.getEntityWithProperties(
          cityId,regionId,statusId);
    }
    catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

}