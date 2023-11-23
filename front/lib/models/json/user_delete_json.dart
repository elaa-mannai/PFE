import 'package:front/models/json/abstract_json_resource.dart';

class UserDeleteJson extends AbstractJsonResource{
  String? message;

  UserDeleteJson({this.message});

  UserDeleteJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}