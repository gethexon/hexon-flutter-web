import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hexon_flutter_web/api/base_model/base_model.dart';
import 'package:hexon_flutter_web/api/leancloud/config.dart';

class UserApi {
  Future<ApiResponseModel> signup(String email, String password) async {
    var options = Options(
      headers: {
        'X-LC-Id': apiAppId,
        'X-LC-Key': apiAppKey,
        // 'Content-Type': 'application/json',
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    );
    try {
      var response = await Dio().post(
        apiBaseUrl + '/1.1/users',
        data: {
          "username": email[0].toUpperCase(),
          "password": password,
          "email": email,
        },
        options: options,
      );
      print(response);
      if (response.statusCode == HttpStatus.created) {
        return ApiResponseModel(isSuccess: true);
      } else {
        return ApiResponseModel(isSuccess: false, errorMessage: "");
      }
    } on DioError catch (e) {
      return ApiResponseModel(
          isSuccess: false, errorMessage: e.response!.data['error']);
    } catch (e) {
      return ApiResponseModel(isSuccess: false, errorMessage: e.toString());
    }
  }
}
