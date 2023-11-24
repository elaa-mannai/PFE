import 'package:front/models/json/abstract_json_resource.dart';

class CreateDemandeJson extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  CreateDemandeJson({this.message, this.status, this.data});

  CreateDemandeJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? state;
  String? products;
  String? events;
  String? sId;
  int? iV;

  Data({this.state, this.products, this.events, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    products = json['products'];
    events = json['events'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['products'] = this.products;
    data['events'] = this.events;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }

}