import 'package:dio/dio.dart';
import 'package:hexon_flutter_web/api/base_model/base_model.dart';
import 'package:hexon_flutter_web/api/leancloud/config.dart';

class BaseApi {
  Future<ApiResponseModel> post(String url, dynamic data) async {
    var options = Options(
      headers: {
        'X-LC-Id': apiAppId,
        'X-LC-Key': apiAppKey,
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    );
    try {
      var response = await Dio().post(
        apiBaseUrl + url,
        data: data,
        options: options,
      );
      print(response);
      if (200 <= response.statusCode! && response.statusCode! < 300) {
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
