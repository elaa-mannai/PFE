import 'package:front/models/json/abstract_json_resource.dart';

class GetDemandeByIdJson extends AbstractJsonResource {
   String? message;
  int? status;
  Data? data;

  GetDemandeByIdJson({this.message, this.status, this.data});

  GetDemandeByIdJson.fromJson(Map<String, dynamic> json) {
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
  Products? products;
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
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    users = json['users'];
    events = json['events'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['vendor'] = this.vendor;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    data['users'] = this.users;
    data['events'] = this.events;
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  String? sId;
  String? nameproduct;
  String? description;
  int? price;
  String? location;
  List<String>? images;
  String? category;
  User? user;
  int? iV;
  String? favorites;

  Products(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
      this.location,
      this.images,
      this.category,
      this.user,
      this.iV,
      this.favorites});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameproduct = json['nameproduct'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    images = json['images'].cast<String>();
    category = json['category'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    iV = json['__v'];
    favorites = json['favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameproduct'] = this.nameproduct;
    data['description'] = this.description;
    data['price'] = this.price;
    data['location'] = this.location;
    data['images'] = this.images;
    data['category'] = this.category;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['__v'] = this.iV;
    data['favorites'] = this.favorites;
    return data;
  }
}

class User {
  String? sId;
  String? items;
  String? username;
  String? email;
  String? password;
  List<String>? favorites;
  List<String>? events;
  List<String>? products;
  List<dynamic>? chats;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  String? fCMToken;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    favorites = json['favorites'].cast<String>();
    events = json['events'].cast<String>();
    products = json['products'].cast<String>();
    chats = json['chats'].cast<dynamic>();
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