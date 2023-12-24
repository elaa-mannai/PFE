import 'package:front/models/json/abstract_json_resource.dart';

class UpdateDemandeByIdJson extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  UpdateDemandeByIdJson({this.message, this.status, this.data});

  UpdateDemandeByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  bool? state;
  String? vendor;
  String? products;
  String? users;
  String? events;
  int? iV;

  Data(
      {this.sId,
      this.state,
      this.vendor,
      this.products,
      this.users,
      this.events,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    vendor = json['vendor'];
    products = json['products'];
    users = json['users'];
    events = json['events'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['vendor'] = this.vendor;
    data['products'] = this.products;
    data['users'] = this.users;
    data['events'] = this.events;
    data['__v'] = this.iV;
    return data;
  }
}