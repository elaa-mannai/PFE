import 'package:front/models/json/abstract_json_resource.dart';

class GetDemandeByIdJson extends AbstractJsonResource {
  String? message;
  int? status;
  List<Data>? data;

  GetDemandeByIdJson({this.message, this.status, this.data});

  GetDemandeByIdJson.fromJson(Map<String, dynamic> json) {
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
  bool? state;
  Products? products;
  Users? users;
  Events? events;
  int? iV;

  Data({this.sId, this.state, this.products, this.users, this.events, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    events =
        json['events'] != null ? new Events.fromJson(json['events']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  String? sId;
  String? nameproduct;
  String? description;
  int? price;
  List<dynamic>? images;
  String? category;
  User? user;
  int? iV;
  String? favorites;

  Products(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
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
    images = json['images'].cast<dynamic>();
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
  List<String>? guests;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  String? adress;
  String? image;
  int? phone;

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
      this.phone});

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
    return data;
  }
}

class Users {
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
  List<String>? demande;

  Users(
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
      this.demande});

  Users.fromJson(Map<String, dynamic> json) {
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
    demande = json['demande'].cast<String>();
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
    data['demande'] = this.demande;
    return data;
  }
}

class Events {
  String? sId;
  String? titleevent;
  String? description;
  String? dateDebut;
  String? dateFin;
  String? local;
  int? budget;
  String? user;
  List<String>? guests;
  int? iV;
  List<String>? demande;

  Events(
      {this.sId,
      this.titleevent,
      this.description,
      this.dateDebut,
      this.dateFin,
      this.local,
      this.budget,
      this.user,
      this.guests,
      this.iV,
      this.demande});

  Events.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titleevent = json['titleevent'];
    description = json['description'];
    dateDebut = json['date_debut'];
    dateFin = json['date_fin'];
    local = json['local'];
    budget = json['budget'];
    user = json['user'];
    guests = json['guests'].cast<String>();
    iV = json['__v'];
    demande = json['demande'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['titleevent'] = this.titleevent;
    data['description'] = this.description;
    data['date_debut'] = this.dateDebut;
    data['date_fin'] = this.dateFin;
    data['local'] = this.local;
    data['budget'] = this.budget;
    data['user'] = this.user;
    data['guests'] = this.guests;
    data['__v'] = this.iV;
    data['demande'] = this.demande;
    return data;
  }
}
