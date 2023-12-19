import 'package:front/models/json/abstract_json_resource.dart';

class UserGetByIdJson extends AbstractJsonResource {
 String? message;
  int? status;
  Data? data;

  UserGetByIdJson({this.message, this.status, this.data});

  UserGetByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? items;
  String? username;
  String? email;
  String? password;
  String? city;
  String? adress;
  int? phone;
  String? image;
  String? fCMToken;
  List<String>? favorites;
  List<String>? events;
  List<String>? products;
  List<String>? chats;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.items,
      this.username,
      this.email,
      this.password,
      this.city,
      this.adress,
      this.phone,
      this.image,
      this.fCMToken,
      this.favorites,
      this.events,
      this.products,
      this.chats,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    city = json['city'];
    adress = json['adress'];
    phone = json['phone'];
    image = json['image'];
    fCMToken = json['FCMToken'];
    favorites = json['favorites'].cast<String>();
    events = json['events'].cast<String>();
    products = json['products'].cast<String>();
    chats = json['chats'].cast<String>();
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['city'] = this.city;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['FCMToken'] = this.fCMToken;
    data['favorites'] = this.favorites;
    data['events'] = this.events;
    data['products'] = this.products;
    data['chats'] = this.chats;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}








  /* String? message;
  int? status;
  Data? data;

  UserGetByIdJson({this.message, this.status, this.data});

  UserGetByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? items;
  String? username;
  String? email;
  String? password;
  List<dynamic>? events;
  List<dynamic>? guests;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  String? adress;
  String? image;
  int? phone;
  List<dynamic>? products;
  List<Favorites>? favorites;

  Data(
      {this.sId,
      this.items,
      this.username,
      this.email,
      this.password,
      this.events,
      this.guests,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.refreshToken,
      this.adress,
      this.image,
      this.phone,
      this.products,
      this.favorites});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    events = json['events'].cast<dynamic>();
    guests = json['guests'].cast<dynamic>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
    adress = json['adress'];
    image = json['image'];
    phone = json['phone'];

    products = json['products'].cast<dynamic>();
    if (json['favorites'] != null) {
      favorites = <Favorites>[];
      json['favorites'].forEach((v) {
        favorites!.add(new Favorites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['items'] = this.items;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['events'] = this.events;
    data['guests'] = this.guests;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    data['adress'] = this.adress;
    data['image'] = this.image;
    data['phone'] = this.phone;
      data['products'] = this.products;
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorites {
  String? sId;
  bool? state;
  String? user;
  String? products;
  int? iV;

  Favorites({this.sId, this.state, this.user, this.products, this.iV});

  Favorites.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    user = json['user'];
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
 */