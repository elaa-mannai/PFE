import 'package:front/models/json/abstract_json_resource.dart';

class SenderIDAndRecieverIdJson extends AbstractJsonResource{
  String? message;
  int? status;
  List<Data>? data;

  SenderIDAndRecieverIdJson({this.message, this.status, this.data});

  SenderIDAndRecieverIdJson.fromJson(Map<String, dynamic> json) {
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
  List<String>? messages;
  String? sender;
  String? reciever;
  int? iV;

  Data({this.sId, this.messages, this.sender, this.reciever, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    messages = json['messages'].cast<String>();
    sender = json['sender'];
    reciever = json['reciever'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['messages'] = this.messages;
    data['sender'] = this.sender;
    data['reciever'] = this.reciever;
    data['__v'] = this.iV;
    return data;
  }
}