import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/chat_by_user_id.dart';
import 'package:front/models/network/api_manager.dart';

class ApiChatByUserId extends ApiManager {
  String idS = '';


  @override
  String apiUrl() {
    String url = "${AppApi.getChatBySendor}$idS";
    print("url ApiChatByUserId ${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GetChatByUserId.fromJson(data);
  }
}
