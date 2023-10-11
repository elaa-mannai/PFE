
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/facture_create_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFacture extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.createFactureUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FactureCreateJson.fromJson(data);
  }
}
