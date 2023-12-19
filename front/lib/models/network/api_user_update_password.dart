import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/json/user_update_password_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiUserUpdatePassword extends ApiManager {
  String id = '';
  
  @override
  String apiUrl() {
    print("url update password ${ AppApi.updatePasswordUrl + id}");
    return AppApi.updatePasswordUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return UserUpdatePasswordJson.fromJson(data);
  }
}
