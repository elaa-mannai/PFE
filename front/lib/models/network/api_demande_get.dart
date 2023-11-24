import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_get_all_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeGetAll extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.getAllDemande;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GetAllDemandeJson.fromJson(data);
  }
}
