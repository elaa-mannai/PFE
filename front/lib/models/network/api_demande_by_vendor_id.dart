import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_by_vendor_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeByVendorId extends ApiManager {
  String id = '';


  @override
  String apiUrl() {
    String url =AppApi.getDemandeByVendorId +id;
    print("url getDemandeByVendorId${url}");
    return url;
    
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return DemandeByVendorIdJson.fromJson(data);
  }
}
