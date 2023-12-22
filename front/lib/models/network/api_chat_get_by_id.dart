import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/chat_by_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiChatGetById extends ApiManager {
  String id = "";
  @override
  String apiUrl() {
    return AppApi.getChatById +id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GetChatById.fromJson(data);
  }
}
