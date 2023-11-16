import 'package:front/models/json/abstract_json_resource.dart';

class ProductAddJson extends AbstractJsonResource {
  String? message;
  int? status;
  Data? data;

  ProductAddJson({this.message, this.status, this.data});

  ProductAddJson.fromJson(Map<String, dynamic> json) {
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
  String? nameproduct;
  String? description;
  int? price;
  String? location;
  List<dynamic>? images;
  String? category;
  String? user;
  String? sId;
  int? iV;

  Data(
      {this.nameproduct,
      this.description,
      this.price,
      this.location,
      this.images,
      this.category,
      this.user,
      this.sId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    nameproduct = json['nameproduct'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    images = json['images'].cast<dynamic>();
    category = json['category'];
    user = json['user'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameproduct'] = this.nameproduct;
    data['description'] = this.description;
    data['price'] = this.price;
    data['location'] = this.location;
    data['images'] = this.images;
    data['category'] = this.category;
    data['user'] = this.user;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
