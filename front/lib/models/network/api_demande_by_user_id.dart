

import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_by_user_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeByUserId extends ApiManager {
  String id = '';


  @override
  String apiUrl() {
    String url = AppApi.getDemandeByUserId + id;
    print("url DemandeByVendorId ${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return DemandeByUserIdJson.fromJson(data);
  }
}
