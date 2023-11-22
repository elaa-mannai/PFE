import 'package:front/models/json/abstract_json_resource.dart';

class FavoriteByUserIdAndStateJson extends AbstractJsonResource {
  String? message;
  int? status;
  List<Data>? data;

  FavoriteByUserIdAndStateJson({this.message, this.status, this.data});

  FavoriteByUserIdAndStateJson.fromJson(Map<String, dynamic> json) {
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
  String? user;
  Products? products;
  int? iV;

  Data({this.sId, this.state, this.user, this.products, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    user = json['user'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['user'] = this.user;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
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
  Category? category;
  String? user;
  int? iV;
  Favorites? favorites;
  String? location;

  Products(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
      this.images,
      this.category,
      this.user,
      this.iV,
      this.favorites,
      this.location});

  Products.fromJson(Map<String, dynamic> json) {
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
    favorites = json['favorites'] != null
        ? new Favorites.fromJson(json['favorites'])
        : null;
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
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.toJson();
    }
    data['location'] = this.location;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  int? iV;

  Category({ this.sId, this.name, this.iV});

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
