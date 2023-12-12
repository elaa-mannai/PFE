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
  List<String>? images;
  Category? category;
  User? user;
  int? iV;
  Favorites? favorites;

  Data(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
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
    images = json['images'].cast<String>();
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
  List<String>? guests;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  String? adress;
  String? image;
  int? phone;
  String? fCMToken;
  List<String>? chats;

  User(
      {this.sId,
      this.items,
      this.username,
      this.email,
      this.password,
      this.favorites,
      this.events,
      this.products,
      this.guests,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.refreshToken,
      this.adress,
      this.image,
      this.phone,
      this.fCMToken,
      this.chats});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    favorites = json['favorites'].cast<String>();
    events = json['events'].cast<String>();
    products = json['products'].cast<String>();
    guests = json['guests'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
    adress = json['adress'];
    image = json['image'];
    phone = json['phone'];
    fCMToken = json['FCMToken'];
    chats = json['chats'].cast<String>();
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
    data['guests'] = this.guests;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    data['adress'] = this.adress;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['FCMToken'] = this.fCMToken;
    data['chats'] = this.chats;
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