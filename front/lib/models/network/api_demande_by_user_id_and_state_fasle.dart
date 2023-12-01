

import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_by_user_id_and_state_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeByUserIdAndStateFasle extends ApiManager {
  String id = '';
  String state = '';


  @override
  String apiUrl() {
    String url = "${AppApi.getDemandeByUserIdAndStateUrl}$id/state?state=false";
    print("url ${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return DemandeByUserIdAndStateJson.fromJson(data);
  }
}
