
import 'package:dio/dio.dart';
import 'package:e_space_mobile/base/base_repository.dart';
import 'package:e_space_mobile/data/provider/api_client.dart';
import 'package:e_space_mobile/data/provider/server_error.dart';

class AuthRepository extends BaseRepository{
  ApiClient? _apiClient;

  AuthRepository(){
    _apiClient = ApiClient.getInstance();
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

  Future<dynamic> refreshToken(String token) async {
    var response;
    try{
      response = await _apiClient?.refreshToken(token);
    }catch(error){
      response = getErrorMessage(
          ServerError.withError(error: error as DioError).getErrorMessage());
    }
    return response;
  }

}