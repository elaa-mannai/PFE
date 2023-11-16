import 'package:front/models/json/abstract_json_resource.dart';

class ProductGetJson extends AbstractJsonResource {
 String? message;
  int? status;
  List<Data>? data;

  ProductGetJson({this.message, this.status, this.data});

  ProductGetJson.fromJson(Map<String, dynamic> json) {
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
  String? nameproduct;
  String? description;
  int? price;
  List<dynamic>? images;
  Category? category;
  String? user;
  int? iV;
  String? location;

  Data(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
      this.images,
      this.category,
      this.user,
      this.iV,
      this.location});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameproduct = json['nameproduct'];
    description = json['description'];
    price = json['price'];
    images = json['images'].cast<dynamic>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'];
    iV = json['__v'];
    location = json['location'];
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
    data['user'] = this.user;
    data['__v'] = this.iV;
    data['location'] = this.location;
    return data;
  }
}

class Category {
  List<String>? products;
  String? sId;
  String? name;
  int? iV;

  Category({this.products, this.sId, this.name, this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    products = json['products'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products'] = this.products;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    return data;
  }
}