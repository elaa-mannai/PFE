import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_get_all_json.dart';
import 'package:front/models/json/demande_uodate_by_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeUpdatebyId extends ApiManager {
  String id = "";
  @override
  String apiUrl() {
    return AppApi.demandeUpdate + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return UpdateDemandeByIdJson.fromJson(data);
  }
}
