import 'package:front/models/json/abstract_json_resource.dart';

class GetChatByUserId extends AbstractJsonResource {
 String? message;
  int? status;
  List<Data>? data;

  GetChatByUserId({this.message, this.status, this.data});

  GetChatByUserId.fromJson(Map<String, dynamic> json) {
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
  Reciever? reciever;
  int? iV;

  Data({this.sId, this.messages, this.sender, this.reciever, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    messages = json['messages'].cast<String>();
    sender = json['sender'];
    reciever = json['reciever'] != null
        ? new Reciever.fromJson(json['reciever'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['messages'] = this.messages;
    data['sender'] = this.sender;
    if (this.reciever != null) {
      data['reciever'] = this.reciever!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Reciever {
  String? sId;
  String? items;
  String? username;
  String? email;
  String? password;
  List<String>? favorites;
  List<String>? events;
  List<String>? products;
  List<String>? chats;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  String? fCMToken;

  Reciever(
      {this.sId,
      this.items,
      this.username,
      this.email,
      this.password,
      this.favorites,
      this.events,
      this.products,
      this.chats,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.refreshToken,
      this.fCMToken});

  Reciever.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    favorites = json['favorites'].cast<String>();
    events = json['events'].cast<String>();
    products = json['products'].cast<String>();
    chats = json['chats'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
    fCMToken = json['FCMToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['items'] = this.items;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['favorites'] = this.favorites;
    data['events'] = this.events;
    data['products'] = this.products;
    data['chats'] = this.chats;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    data['FCMToken'] = this.fCMToken;
    return data;
  }
}