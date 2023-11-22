import 'package:front/models/json/abstract_json_resource.dart';

class CategorieGetByNameJson extends AbstractJsonResource {
  String? message;
  ExistingCategorie? existingCategorie;

  CategorieGetByNameJson({this.message, this.existingCategorie});

  CategorieGetByNameJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    existingCategorie = json['existingCategorie'] != null
        ? new ExistingCategorie.fromJson(json['existingCategorie'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.existingCategorie != null) {
      data['existingCategorie'] = this.existingCategorie!.toJson();
    }
    return data;
  }
}

class ExistingCategorie {
  String? sId;
  String? name;
  int? iV;

  ExistingCategorie({this.sId, this.name,  this.iV});

  ExistingCategorie.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
