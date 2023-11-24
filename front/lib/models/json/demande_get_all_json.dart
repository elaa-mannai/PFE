
import 'package:front/models/json/abstract_json_resource.dart';

class GetAllDemandeJson extends AbstractJsonResource{ String? message;
  int? status;
  List<Data>? data;

  GetAllDemandeJson({this.message, this.status, this.data});

  GetAllDemandeJson.fromJson(Map<String, dynamic> json) {
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
  String? user;
  String? products;
  String? events;
  bool? state;
  int? iV;

  Data({this.sId, this.user, this.products, this.events, this.state, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    products = json['products'];
    events = json['events'];
    state = json['state'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['products'] = this.products;
    data['events'] = this.events;
    data['state'] = this.state;
    data['__v'] = this.iV;
    return data;
  }
}