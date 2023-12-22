
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/chat_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiNewChat extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.createNewChat;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return CreateNewChatJson.fromJson(data);
  }
}
