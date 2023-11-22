import 'package:front/config/app_api.dart';
import 'package:front/models/json/ProductDeleteJson.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/network/api_manager.dart';

class ApiProductDeleteById extends ApiManager {
    String id = '';

  @override
  String apiUrl() {
    return AppApi.deleteProductUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return ProductDeleteJson.fromJson(data);
  }
}
