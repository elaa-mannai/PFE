

import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_by_vendir_id_and_state.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeByVendorIdAndState extends ApiManager {
  String id = '';
   String state = '';


  @override
  String apiUrl() {
    String url ="${AppApi.getDemandeByVendorIdAndState}$id/state?state=false";
    print("url getDemandeByVendorIdandstate${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return DemandeByVendorIdAndStateJson.fromJson(data);
  }
}
