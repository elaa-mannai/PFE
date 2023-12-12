import 'package:front/models/json/abstract_json_resource.dart';

class DemandeByVendorIdAndStateJson extends AbstractJsonResource {
  String? message;
  int? status;
  List<Data>? data;

  DemandeByVendorIdAndStateJson({this.message, this.status, this.data});

  DemandeByVendorIdAndStateJson.fromJson(Map<String, dynamic> json) {
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
  String? products;
  String? users;
  // String? events;
  int? iV;

  Data(
      {this.sId,
      this.state,
      this.vendor,
      this.products,
      this.users,
      // this.events,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    vendor = json['vendor'];
    products = json['products'];
    users = json['users'];
    // events = json['events'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['vendor'] = this.vendor;
    data['products'] = this.products;
    data['users'] = this.users;
    // data['events'] = this.events;
    data['__v'] = this.iV;
    return data;
  }
}

// class Products {
//   String? sId;
//   String? nameproduct;
//   String? description;
//   int? price;
//   String? location;
//   List<dynamic>? images;
//   String? category;
//   String? user;
//   int? iV;
//   // String? favorites;

//   Products(
//       {this.sId,
//       this.nameproduct,
//       this.description,
//       this.price,
//       this.location,
//       this.images,
//       this.category,
//       this.user,
//       this.iV,
//       // this.favorites
//       });

//   Products.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     nameproduct = json['nameproduct'];
//     description = json['description'];
//     price = json['price'];
//     location = json['location'];
//     images = json['images'].cast<dynamic>();
//     category = json['category'];
//     user = json['user'];
//     iV = json['__v'];
//     // favorites = json['favorites'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['nameproduct'] = this.nameproduct;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['location'] = this.location;
//     data['images'] = this.images;
//     data['category'] = this.category;
//     data['user'] = this.user;
//     data['__v'] = this.iV;
//     // data['favorites'] = this.favorites;
//     return data;
//   }
// }

// class Users {
//   String? sId;
//   String? items;
//   String? username;
//   String? email;
//   String? password;
//   List<String>? favorites;
//   List<String>? events;
//   List<String>? chats;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   String? refreshToken;
//   String? fCMToken;

//   Users(
//       {this.sId,
//       this.items,
//       this.username,
//       this.email,
//       this.password,
//       this.favorites,
//       this.events,
//       this.chats,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.refreshToken,
//       this.fCMToken});

//   Users.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     items = json['items'];
//     username = json['username'];
//     email = json['email'];
//     password = json['password'];
//     favorites = json['favorites'].cast<String>();
//     events = json['events'].cast<String>();
//     chats = json['chats'].cast<String>();
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     refreshToken = json['refreshToken'];
//     fCMToken = json['FCMToken'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['items'] = this.items;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['favorites'] = this.favorites;
//     data['events'] = this.events;
//     data['chats'] = this.chats;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     data['refreshToken'] = this.refreshToken;
//     data['FCMToken'] = this.fCMToken;
//     return data;
//   }
// }


