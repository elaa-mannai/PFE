

import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_by_user_id_and_state_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeByUserIdAndState extends ApiManager {
  String id = '';
  String state = '';

  // ApiFavoriteByUserIdAndState(this.id, this.state);

  @override
  String apiUrl() {
    String url = "${AppApi.getDemandeByUserIdAndStateUrl}$id/state?state=true";
    print("url ${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return DemandeByUserIdAndStateJson.fromJson(data);
  }
}
