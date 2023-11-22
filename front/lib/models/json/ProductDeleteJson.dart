import 'package:front/models/json/abstract_json_resource.dart';

class ProductDeleteJson extends AbstractJsonResource{
  String? message;

  ProductDeleteJson({this.message});

  ProductDeleteJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}