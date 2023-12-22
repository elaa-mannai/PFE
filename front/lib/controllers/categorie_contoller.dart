import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/models/json/categorie_get_by_name_json.dart';
import 'package:front/models/json/categories_json.dart';
import 'package:front/models/json/user_all_json.dart';
import 'package:front/models/network/api_categorie_get_by_name.dart';
import 'package:front/models/network/api_categories_get.dart';
import 'package:front/models/network/api_user_all.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategorieController extends GetxController {
  ApiCategoriesGet apiCategoriesGet = ApiCategoriesGet();
  CategorieJson? categorieJson;
    ApiCategoriesGetByName apiCategoriesGetByName = ApiCategoriesGetByName();

  CategorieGetByNameJson? categorieGetByNameJson;

  final TextEditingController categoryNameController = TextEditingController();

  createCategorie() {
    print("------------------create categorie -------------------");
    Map<String, dynamic> data = {"name": categoryNameController.text};
    print("create categorie function");
    apiCategoriesGet.postData(data).then((value) {
      categorieJson = value as CategorieJson?;
      update();
      getCategories();
    }).onError((error, stackTrace) {
      print('error create categorie ==========> $error');
    });
  }

  /* getCategories() {
    return apiCategoriesGet.getData().then((value) {
      print("success get categories");
      categorieJson = value as CategorieJson;
      if (categorieJson!.data != null) {
        return categorieJson!;
      }
      print(
          "data length categories =================== ${categorieJson!.data!.length}");
      update();
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return categorieJson!;
    });
  }


   getCategorieByName() {
    print('category by name-----------------------');
    apiCategoriesGetByName.name;
    return apiCategoriesGetByName.getDataByName().then((value) {
      categorieGetByNameJson = value as CategorieGetByNameJson?;
      print(
          "data categorie by name=================== ${categorieGetByNameJson!.existingCategorie!.name}");

      AccountInfoStorage.saveCatgorieName(
          categorieGetByNameJson!.existingCategorie!.sId);
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
  } */


 Future<List<String>?> getCategories() async {
    try {
      categorieJson = await apiCategoriesGet.getData() as CategorieJson;
      if (categorieJson!.data != null) {
        // Extract category names from the data
        List<String> categories =
            categorieJson!.data!.map((category) => category.name!).toList();
        update();
        return categories;
      }
    } catch (error) {
      print("Error getting categories: $error");
    }
    return null;
  }

  Future<void> getCategorieByName(String? categoryName) async {
    if (categoryName != null) {
      try {
        apiCategoriesGetByName.name = categoryName;
        categorieGetByNameJson =
            await apiCategoriesGetByName.getDataByName() as CategorieGetByNameJson?;
        if (categorieGetByNameJson != null) {
          // Save category ID or other relevant information
          AccountInfoStorage.saveCatgorieName(
              categorieGetByNameJson!.existingCategorie!.sId);
        }
      } catch (error) {
        print('Error getting category by name: $error');
      }
    }
  }
}
