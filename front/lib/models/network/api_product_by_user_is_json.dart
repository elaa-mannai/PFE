import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/product_by_category_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiProductGetByCategoryId extends ApiManager {
  String id = "";
  @override
  String apiUrl() {
    print('url p C ${AppApi.getProductsBycategorieIdUrl + id}');
    return AppApi.getProductsBycategorieIdUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return ProductsByCategoryIdJson.fromJson(data);
  }
}
