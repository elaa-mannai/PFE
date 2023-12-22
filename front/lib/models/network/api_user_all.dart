import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/user_all_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiUserAll extends ApiManager {

  @override
  String apiUrl() {
    return AppApi.allUsers;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return UsersAllJson.fromJson(data);
  }
}
