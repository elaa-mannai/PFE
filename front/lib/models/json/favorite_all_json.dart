import 'package:front/models/json/abstract_json_resource.dart';

class FavoriteAllJson extends AbstractJsonResource {
 String? message;
  int? status;
  List<Data>? data;

  FavoriteAllJson({this.message, this.status, this.data});

  FavoriteAllJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  bool? state;
  List<String>? user;
  String? products;
  int? iV;

  Data({this.sId, this.state, this.user, this.products, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    user = json['user'].cast<String>();
    products = json['products'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['user'] = this.user;
    data['products'] = this.products;
    data['__v'] = this.iV;
    return data;
  }
} 