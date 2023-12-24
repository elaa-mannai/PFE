import 'package:front/models/json/abstract_json_resource.dart';

class ProductGetByIdJson extends AbstractJsonResource {
  String? message;
  int? status;
  Data? data;

  ProductGetByIdJson({this.message, this.status, this.data});

  ProductGetByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? nameproduct;
  String? description;
  int? price;
  String? location;
  List<dynamic>? images;
  Category? category;
  User? user;
  int? iV;
  Favorites? favorites;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameproduct = json['nameproduct'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    images = json['images'].cast<dynamic>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    iV = json['__v'];
    favorites = json['favorites'] != null
        ? new Favorites.fromJson(json['favorites'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameproduct'] = this.nameproduct;
    data['description'] = this.description;
    data['price'] = this.price;
    data['location'] = this.location;
    data['images'] = this.images;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['__v'] = this.iV;
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.toJson();
    }
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  int? iV;

  Category({this.sId, this.name, this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
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
  List<String>? chats;
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
