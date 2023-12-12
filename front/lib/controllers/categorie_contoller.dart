import 'package:flutter/material.dart';
import 'package:front/models/json/categories_json.dart';
import 'package:front/models/network/api_categories_get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategorieController extends GetxController {
  ApiCategoriesGet apiCategoriesGet = ApiCategoriesGet();
  CategorieJson? categorieJson;

  final TextEditingController categoryNameController = TextEditingController();

  createCategorie() {
    print("------------------create categorie -------------------");
    Map<String, dynamic> data = {"name": categoryNameController.text};
    print("create categorie function");
    apiCategoriesGet.postData(data).then((value) {
      categorieJson = value as CategorieJson?;
      getCategories();

      update();
    }).onError((error, stackTrace) {
      print('error create categorie ==========> $error');
    });
  }

  getCategories() {
    return apiCategoriesGet.getData().then((value) {
      print("success get categories");
      categorieJson = value as CategorieJson;
      if (categorieJson!.data != null) {
        return categorieJson!;
      }
      print("data categories =================== ${categorieJson!.message}");
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return categorieJson!;
    });
  }
}
