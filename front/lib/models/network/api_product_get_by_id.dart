import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/product_get_by_id.dart';
import 'package:front/models/network/api_manager.dart';

class ApiProductGetById extends ApiManager {
  String id = "";
  @override
  String apiUrl() {
    print("url ApiProductGetById ${AppApi.getProductsUrl + id}");
    return AppApi.getProductsUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return ProductGetByIdJson.fromJson(data);
  }
}
