import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/user_delete_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiUserDeleteById extends ApiManager {
    String id = '';

  @override
  String apiUrl() {
    return AppApi.deleteUserUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return UserDeleteJson.fromJson(data);
  }
}
