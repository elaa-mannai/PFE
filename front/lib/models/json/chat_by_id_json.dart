 import 'package:front/models/json/abstract_json_resource.dart';

class GetChatById extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  GetChatById({this.message, this.status, this.data});

  GetChatById.fromJson(Map<String, dynamic> json) {
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
  List<dynamic>? messages;
  String? sender;
  String? reciever;
  int? iV;

  Data({this.sId, this.messages, this.sender, this.reciever, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    messages = json['messages'].cast<dynamic>();
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