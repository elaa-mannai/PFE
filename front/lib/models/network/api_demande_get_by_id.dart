import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/demande_get_by_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiDemandeGetById extends ApiManager {
  String id ="";
  @override
  String apiUrl() {
    return AppApi.getDemandeById+id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GetDemandeByIdJson.fromJson(data);
  }
}
