import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/network/api_manager.dart';

class ApiUserById extends ApiManager {
  String id = '';
  
  @override
  String apiUrl() {
    return AppApi.getUserByIdUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return UserGetByIdJson.fromJson(data);
  }
}
