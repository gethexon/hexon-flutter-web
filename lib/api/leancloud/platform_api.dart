import 'package:hexon_flutter_web/api/base_model/base_model.dart';
import 'package:hexon_flutter_web/api/leancloud/base_api.dart';

class PlatformApi {
  Future<ApiResponseModel> getMyPlatforms(String userObjectId) async {
    return BaseApi().get(
      '/1.1/classes/PlatformToken',
      {'where': '{"owner": "' + userObjectId + '"}'},
    );
  }
}
