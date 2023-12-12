import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/chat_get_all_json.dart';
import 'package:front/models/json/favorite_by_user_id_and_state_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiAllChatByUserAndCustomerIDs extends ApiManager {
  String idS = '';
  String idR = '';


  @override
  String apiUrl() {
    String url = "${AppApi.getChatBySendorAndReciever}$idS/$idR";
    print("url ${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GetAllChatJson.fromJson(data);
  }
}
