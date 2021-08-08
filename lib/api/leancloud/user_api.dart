import 'package:hexon_flutter_web/api/base_model/base_model.dart';
import 'package:hexon_flutter_web/api/leancloud/base_api.dart';

class UserApi {
  Future<ApiResponseModel> signup(String email, String password) async {
    return BaseApi().post('/1.1/users', {
      "username": email[0].toUpperCase(),
      "password": password,
      "email": email,
    });
  }

  Future<ApiResponseModel> signin(String email, String password) async {
    return BaseApi().post('/1.1/login', {
      "password": password,
      "email": email,
    });
  }

  Future<ApiResponseModel> me() async {
    return BaseApi().getWithAuth('/1.1/users/me');
  }

  Future<ApiResponseModel> requestEmailVerify(String email) async {
    return BaseApi().post('/1.1/requestEmailVerify', {
      "email": email,
    });
  }
}
