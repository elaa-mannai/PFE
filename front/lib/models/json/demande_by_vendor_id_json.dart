import 'package:front/models/json/abstract_json_resource.dart';

class DemandeByVendorIdJson extends AbstractJsonResource {
  String? message;
  int? status;
  List<Data>? data;

  DemandeByVendorIdJson({this.message, this.status, this.data});

  DemandeByVendorIdJson.fromJson(Map<String, dynamic> json) {
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
  List<dynamic>? images;
  String? category;
  String? user;
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
    images = json['images'].cast<dynamic>();
    category = json['category'];
    user = json['user'];
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
    data['user'] = this.user;
    data['__v'] = this.iV;
    data['favorites'] = this.favorites;
    return data;
  }
}