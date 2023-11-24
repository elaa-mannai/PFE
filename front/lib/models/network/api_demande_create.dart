
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_create_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemande extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.createDemande;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return CreateDemandeJson.fromJson(data);
  }
}
