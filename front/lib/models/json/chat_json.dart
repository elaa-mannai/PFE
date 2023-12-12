import 'package:front/models/json/abstract_json_resource.dart';

class CreateNewChatJson extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  CreateNewChatJson({this.message, this.status, this.data});

  CreateNewChatJson.fromJson(Map<String, dynamic> json) {
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
  String? message;
  String? sender;
  String? reciever;
  String? sId;
  int? iV;

  Data({this.message, this.sender, this.reciever, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sender = json['sender'];
    reciever = json['reciever'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['reciever'] = this.reciever;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}