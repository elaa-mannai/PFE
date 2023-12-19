import 'dart:io';
import 'dart:typed_data';
import 'package:cloudinary/cloudinary.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/models/json/categorie_get_by_name_json.dart';
import 'package:front/models/json/categories_json.dart';
import 'package:front/models/json/favorite__create_json.dart';
import 'package:front/models/json/favorite_all_json.dart';
import 'package:front/models/json/favorite_by_id_json.dart';
import 'package:front/models/json/favorite_by_state_json.dart';
import 'package:front/models/json/favorite_by_user_id_and_state_json.dart';
import 'package:front/models/json/favorite_by_user_id_json.dart';
import 'package:front/models/json/product_add_json.dart';
import 'package:front/models/json/product_by_category_id_json.dart';
import 'package:front/models/json/product_by_user_is_json.dart';
import 'package:front/models/json/product_get_by_id.dart';
import 'package:front/models/json/product_get_json.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/network/api_categorie_get_by_id.dart';
import 'package:front/models/network/api_categorie_get_by_name.dart';
import 'package:front/models/network/api_categories_get.dart';
import 'package:front/models/network/api_favorite_all.dart';
import 'package:front/models/network/api_favorite_by_id.dart';
import 'package:front/models/network/api_favorite_by_state.dart';
import 'package:front/models/network/api_favorite_create.dart';
import 'package:front/models/network/api_favorite_delete.dart';
import 'package:front/models/network/api_favorite_get_by_user_id.dart';
import 'package:front/models/network/api_favorite_get_by_user_id_and_state.dart';
import 'package:front/models/network/api_get_user_by_id.dart';
import 'package:front/models/network/api_product_add.dart';
import 'package:front/models/network/api_product_by_user_is_json.dart';
import 'package:front/models/network/api_product_delete.dart';
import 'package:front/models/network/api_product_get.dart';
import 'package:front/models/network/api_product_get_by_id.dart';
import 'package:front/models/network/api_products_get_by_user_id.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:front/models/json/categorie_get_by_id_json.dart';

class ProductsController extends GetxController {
  ApiCategoriesGet apiCategoriesGet = ApiCategoriesGet();
  ApiCategoriesGetById apiCategoriesGetById = ApiCategoriesGetById();
  CategorieJson? categorieJson;
  CategorieGetByIdJson? categorieGetByIdJson;
  CategorieGetByNameJson? categorieGetByNameJson;

  ApiProductsGet apiProductsGet = ApiProductsGet();
  ApiProductGetById apiProductGetById = ApiProductGetById();
  ApiProductAdd apiProductAdd = ApiProductAdd();
  ApiCategoriesGetByName apiCategoriesGetByName = ApiCategoriesGetByName();
  ApiProductsGetByUserId apiProductsGetByUserId = ApiProductsGetByUserId();
  ApiProductDeleteById apiProductDeleteById = ApiProductDeleteById();
  ProductsByUserIdJson? productsByUserIdJson;
  ProductGetJson? productGetJson;
  ProductGetByIdJson? productGetByIdJson;
  ProductAddJson? productAddJson;

  ApiFavoriteCreate apiFavoriteCreate = ApiFavoriteCreate();
  ApiFavoriteDeleteById apiFavoriteDeleteById = ApiFavoriteDeleteById();
  ApiFavoriteGetByUserId apiFavoriteGetByUserId = ApiFavoriteGetByUserId();
  ApiFAvoriteGetById apiFAvoriteGetById = ApiFAvoriteGetById();
  ApiFAvoriteGetState apiFAvoriteGetState = ApiFAvoriteGetState();
  ApiFavoriteAll apiFavoriteAll = ApiFavoriteAll();
  ApiFavoriteByUserIdAndState apiFavoriteByUserIdAndState =
      ApiFavoriteByUserIdAndState();

  FavoriteByUserIdJson? favoriteByUserIdJson = FavoriteByUserIdJson();
  FavoriteAllJson? favoriteAllJson = FavoriteAllJson();
  FavoriteByIdJson? favoriteByIdJson = FavoriteByIdJson();
  FavoriteCreateJson? favoriteCreateJson = FavoriteCreateJson();
  FavoriteGeByStatetJson? favoriteGeByStatetJson = FavoriteGeByStatetJson();
  FavoriteByUserIdAndStateJson? favoriteByUserIdAndStateJson =
      FavoriteByUserIdAndStateJson();

  ApiProductGetByCategoryId apiProductGetByCategoryId =
      ApiProductGetByCategoryId();
  ProductsByCategoryIdJson? productsByCategoryIdJson =
      ProductsByCategoryIdJson();

  ApiUserById apiUserById = ApiUserById();
  UserGetByIdJson? userGetByIdJson;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  List<String> imgList = [];

  @override
  Future<void> onInit() async {
    getCategories();
    await getProducts();
    filteredItemsName
        .addAll(productGetJson!.data!.map((data) => data.nameproduct ?? ''));
    filteredItemsDes
        .addAll(productGetJson!.data!.map((data) => data.description ?? ''));
    filteredItemsCat
        .addAll(productGetJson!.data!.map((data) => data.category!.name ?? ''));
    filteredItemsImages
        .addAll(productGetJson!.data!.map((data) => data.images ?? []));

   /*  await getProductByCatgoryId();
    filteredItemsNameC.addAll(
        productsByCategoryIdJson!.data!.map((data) => data.nameproduct ?? ''));
    filteredItemsDesC.addAll(
        productsByCategoryIdJson!.data!.map((data) => data.description ?? ''));
    filteredItemsCatC.addAll(productsByCategoryIdJson!.data!
        .map((data) => data.category!.name ?? ''));
    filteredItemsImagesC.addAll(
        productsByCategoryIdJson!.data!.map((data) => data.images ?? []));
     *///  createProduct();
    // Initialisations spécifiques à ce contrôleur
    super
        .onInit(); // N'oubliez pas d'appeler super.onInit() pour respecter le cycle de vie de GetX.
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

  getNameCategory() {
    print('namecategory');
    String? nameCat;
    apiProductsGet.getData().then((value) {
      for (int i = 0; i < productGetJson!.data!.length; i++) {
        print('for1-------------------------------------');
        for (int y = 0; y < categorieJson!.data!.length; y++) {
          print('for2-------------------------------------');
          if (productGetJson!.data![i].category ==
              categorieJson!.data![y].sId) {
            print(
                '*************************************if**********************');
            // nameCat =
            //     getCategorieById(productGetJson!.data![i].category.toString())
            //         .toString();
            // getCategorieById(productGetJson!.data![i].category) =  categorieJson!.data![y].name
            print(
                '**********NAMECATEGORY**************${getCategorieById(categorieJson!.data![y].sId.toString())}***********************');
          }
        }
      }
    });
    // update();
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
  }

  getCategorieById(String id) {
    print('category by id-----------------------');
    apiCategoriesGetById.id = id;
    return apiCategoriesGetById.getData().then((value) {
      categorieGetByIdJson = value as CategorieGetByIdJson?;
      print(
          "data categorie by id=================== ${categorieGetByIdJson!.data!.name}");

      // AccountInfoStorage.saveCatgorieName(
      //     categorieGetByIdJson!.data!.name.toString());
      // print(
      //     " save storage data ======= ${AccountInfoStorage.readCategorieName().toString()}");
      print('++++++++++++++++++++++++++++++++++');
      AccountInfoStorage.saveCatgorieName(categorieGetByIdJson!.data!.name);
      AccountInfoStorage.readCategorieName().toString();
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
    //  return null;

    //return "${categorieGetByIdJson!.data!.name}";
  }

  getProducts() {
    return apiProductsGet.getData().then((value) async {
      print("success get products");
      productGetJson = value as ProductGetJson?;
      if (productGetJson!.data != null) {
        return productGetJson!;
      }
      return null;
      /*   await getCategorieById(productGetJson!.toJson().toString());
      print('************${productGetJson!.data!.toString()}');
 */
      //print("data products================== ${productGetJson!.message}");
    }).onError((error, stackTrace) {
      print("errorr ====== $error");
      return productGetJson!;
    });
  }

///////// a descuter
  getProductById() async {
    print("product by id ");
    apiProductGetById.id = AccountInfoStorage.readProductId().toString();

    try {
      await apiProductGetById.getData().then((value) {
        productGetByIdJson = value as ProductGetByIdJson?;
        print(
            "data product by id ============================${productGetByIdJson!.data}");
        print(
            "lenght image list=====${productGetByIdJson!.data!.images!.length}");

        if (productGetByIdJson!.data != null) {
          return productGetByIdJson!;
        }
        return null;
      });
      return productGetByIdJson!;
    } catch (error) {
      print("error product by id ==== $error");
    }
    // update();
  }

  getProductByCatgoryId() async {
    print("product by categorie id ------------------------");
    apiProductGetByCategoryId.id =
        AccountInfoStorage.readCategorieId().toString();

    try {
      await apiProductGetByCategoryId.getData().then((value) {
        productsByCategoryIdJson = value as ProductsByCategoryIdJson?;
        print(
            "data product by categorie id ============================${productsByCategoryIdJson!.data}");

        print(
            "lenght image list=====${productsByCategoryIdJson!.data!.length}");
      });
      return productsByCategoryIdJson!;
    } catch (error) {
      print("error product by categorie id ==== $error");
    }
    update();
  }

///////
  getAllProductByUserId() async {
    print("-------------------Product by user id ---------------------");
    apiProductsGetByUserId.id = AccountInfoStorage.readId().toString();

    return await apiProductsGetByUserId.getData().then((value) {
      print('value===========> $value');
      //////////the value is null
      productsByUserIdJson = value as ProductsByUserIdJson?;
      

      if (productsByUserIdJson!.data != null) {
        print(
            "Product by user id =============== ${productsByUserIdJson!.data!.length}");
        return productsByUserIdJson;
      }
      getAllProductByUserId();
      update();
      return null;
      
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
  }

  bool isUpload = false;
  createProduct() {
    print('************************create product***********************');
    Map<String, dynamic> data = {
      "nameproduct": productNameController.text,
      "description": productDescriptionController.text,
      "price": productPriceController.text,
      "location":AccountInfoStorage.readProductLocal(),
      "images": AccountInfoStorage.readProductListImage(),
      "category": AccountInfoStorage.readCategorieName().toString(),
      "user": AccountInfoStorage.readId().toString(),
    };
    try {
      apiProductAdd.postData(data).then((value) {
        print('success+++++++++++++++> $value');

        //AccountInfoStorage.deleteProductListImage();
        print("object");
        // AccountInfoStorage.readProductListImage();
        update();

        // getAllProductByUserId();

        // productAddJson = value as ProductAddJson?;
        //  print('name==================> ${AccountInfoStorage.readProductName()}');

        // print('event created=======> ${productAddJson!.data!.sId}');
      });
    } catch (error) {
      print('error create product ==========> $TypeError');
    }
  }

  updateProduct() async {
    print("update product informations");
    apiProductGetById.id = AccountInfoStorage.readProductId().toString();
    return await apiProductGetById.updateData({
      "nameproduct": productNameController.text,
      "description": productDescriptionController.text,
      "price": productPriceController.text,
      "images": AccountInfoStorage.readProductListImage(),
      "category": AccountInfoStorage.readCategorieName().toString(),
    }).then((value) {
      getAllProductByUserId();
      //Get.snackbar("", "Success",
      //       backgroundColor: AppColor.goldColor,
      // titleText: Text(
      //   "Notification Update",
      //   style: TextStyle(
      //     fontWeight: FontWeight.w600,
      //     fontSize: 24,
      //   ),
      // ));

      update();
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
  }

  deleteProduct() {
    print("delete product");
    apiProductDeleteById.id = AccountInfoStorage.readProductId().toString();

    apiProductDeleteById.deleteData().then((value) {
      print('success Product delete');

      update();
    }).onError((error, stackTrace) {
      print('erorr delete Product  === > $error');
    });
  }

//////////////////////////////////////////

  bool? isFavorite;

  void favoriteIcon() {
    print("favorite");
    isFavorite = !isFavorite!;
    update();
  }

  createFavorite() async {
    print(
        "---------------------- favorite create --------------------------------");

    Map<String, dynamic> data = {
      "state": true,
      "products": AccountInfoStorage.readProductId().toString(),
      "user": AccountInfoStorage.readId().toString(),
    };
    try {
      await apiFavoriteCreate.postData(data).then((value) {
        print('success+++++++++++++++> $value');
        // getProducts();
        favoriteCreateJson = value as FavoriteCreateJson?;
        print("id favorite =====> ${favoriteCreateJson!.data!.sId}");

        // productAddJson = value as ProductAddJson?;
        //  print('name==================> ${AccountInfoStorage.readProductName()}');

        // print('event created=======> ${productAddJson!.data!.sId}');
      });
      getAllFavoriteByUserId();
      AccountInfoStorage.saveProductId(favoriteCreateJson!.data!.products);
      getProductById();
      update();
    } catch (error) {
      print('error create favorite ==========> $TypeError');
    }
  }

  getFavoriteById() {
    print("--------------------------------favorite by id ");
    apiFAvoriteGetById.id = AccountInfoStorage.readFavoriteId().toString();
    apiFAvoriteGetById.getData().then((value) {
      favoriteByIdJson = value as FavoriteByIdJson?;
      print(
          "data favorite by id ============================${favoriteByIdJson!.data}");
    }).onError((error, stackTrace) {
      print("error favorite by id ==== $error");
    });
    update();
  }

  getFavoriteByState() {
    print("-------------------------------------favorite by state ");
    apiFAvoriteGetState.state =
        AccountInfoStorage.readFavoriteState().toString();
    apiFAvoriteGetState.getDataByState().then((value) {
      favoriteGeByStatetJson = value as FavoriteGeByStatetJson?;
      print(
          "data favorite by state ============================${favoriteByIdJson!.data}");
    }).onError((error, stackTrace) {
      print("error favorite by id ==== $error");
    });
    update();
  }

  updateFavorite(bool? favoriteState) async {
    apiFAvoriteGetById.id = AccountInfoStorage.readFavoriteId().toString();
    try {
      await apiFAvoriteGetById
          .updateData({"state": favoriteState}).then((value) {
        print('update success----------------------');

        favoriteByIdJson = value as FavoriteByIdJson?;
        AccountInfoStorage.saveFavoriteState(
            "${favoriteByIdJson!.data!.state}");
      });
      getAllFavoriteByUserId();
      AccountInfoStorage.saveProductId(favoriteByIdJson!.data!.products);
      getProductById();
      update();
    } catch (error) {
      print('error update FAvorite======> $error');
    }
    update();
  }

  getAllFavoriteByUserId() async {
    print("-------------------------Product by user id ---------------------");
    apiFavoriteGetByUserId.id = AccountInfoStorage.readId().toString();

    try {
      return await apiFavoriteGetByUserId.getData().then((value) {
        print('value fav prod===========> $value');
        //////////the value is null
        favoriteByUserIdJson = value as FavoriteByUserIdJson?;
        print(
            '----------------------------------------------fav----${favoriteByUserIdJson!.data}');

        if (favoriteByUserIdJson!.data != null) {
          // print("Product by user id =============== ${productsByUserIdJson!.data![0].user}");
          print(
              '++++++++++++++++++++++++++++++++++++++++++++++++++${favoriteByUserIdJson!.data!.length}');
          return favoriteByUserIdJson!;
        }

        print('----------------------------------------------fav----');

        update();
      });
    } catch (error) {
      print('error======> $error');
    }
  }

  getAllfavoriteByUserIdAndState() async {
    print(
        "-------------------------favoriteByUserIdAndState---------------------");
    apiFavoriteByUserIdAndState.id = AccountInfoStorage.readId().toString();
    apiFavoriteByUserIdAndState.state =
        AccountInfoStorage.readFavoriteState().toString();

    try {
      return await apiFavoriteByUserIdAndState
          .getDataByUserIdAndState()
          .then((value) {
        print('value favoriteByUserIdAndState===========> $value');
        //////////the value is null
        favoriteByUserIdAndStateJson = value as FavoriteByUserIdAndStateJson?;
        print(
            '----------------------------------------------fav----${favoriteByUserIdAndStateJson!.data}');

        if (favoriteByUserIdAndStateJson!.data != null) {
          // print("Product by user id =============== ${productsByUserIdJson!.data![0].user}");
          print(
              '++++++++++length++++++++++++${favoriteByUserIdAndStateJson!.data!.length}');
          return favoriteByUserIdAndStateJson!;
        }

        print(
            '----------------------------------------------favoriteByUserIdAndState----');

        update();
      });
    } catch (error) {
      print('error favoriteByUserIdAndState======> $error');
    }
  }

  getFavorite() {
    return apiFavoriteAll.getData().then((value) async {
      print("success get products");
      favoriteAllJson = value as FavoriteAllJson?;
      if (favoriteAllJson!.data != null) {
        return favoriteAllJson!;
      }
      return null;
      /*   await getCategorieById(productGetJson!.toJson().toString());
      print('************${productGetJson!.data!.toString()}');
 */
      //print("data products================== ${productGetJson!.message}");
    }).onError((error, stackTrace) {
      print("errorr ====== $error");
      return favoriteAllJson!;
    });
  }

  deleteFavorite(String id) {
    apiFavoriteDeleteById.id = id;
    apiFavoriteDeleteById.deleteData().then((value) {
      print('success Favorite delete');
    }).onError((error, stackTrace) {
      print('erorr delete favorite  === > $error');
    });
    update();
  }

  //List<Map<String, dynamic>>? listeDeMaps;
  bool prodExiste(
    List<DataFav> listMap,
    dynamic value,
  ) {
    for (final map in listMap) {
      if (map.products == value) {
        print("+++++++++++++++++++true-------------------");
        return true;
      }
    }
    print('------------------------false--------------------');
    return false;
  }

  List<String> filteredItemsName = [];
  List<String> filteredItemsDes = [];
  List<String> filteredItemsCat = [];
  List<dynamic> filteredItemsImages = [];

  void filterList(String query) {
    filteredItemsImages.clear();
    filteredItemsName.clear();
    filteredItemsDes.clear();
    filteredItemsCat.clear();

    productGetJson!.data!.forEach((item) {
      print('--------filter-------');

      if (item.nameproduct!.toLowerCase().contains(query.toLowerCase()) ||
          item.description!.toLowerCase().contains(query.toLowerCase()) ||
          item.category!.name!.toLowerCase().contains(query.toLowerCase())) {
        filteredItemsName.add(item.nameproduct.toString());
        filteredItemsDes.add(item.description.toString());
        filteredItemsCat.add(item.category!.name.toString());
        filteredItemsImages.add(item.images!.toList());
      }
      update();
    });
  }

 /*  List<String> filteredItemsNameC = [];
  List<String> filteredItemsDesC = [];
  List<String> filteredItemsCatC = [];
  List<dynamic> filteredItemsImagesC = [];

  Future<void> filterList1(String query) async {
    filteredItemsNameC.clear();
    filteredItemsDesC.clear();
    filteredItemsCatC.clear();
    filteredItemsImagesC.clear();

  print('Query: $query');

    productsByCategoryIdJson!.data!.forEach((item) {
      print('--------filter-------');
      // print("length ${productsByCategoryIdJson!.data!.length}");
 print('Item: $item');
      if (item.nameproduct!.toLowerCase().contains(query.toLowerCase()) ||
              item.description!.toLowerCase().contains(query.toLowerCase())
          // || item.category!.name!.toLowerCase().contains(query.toLowerCase())
          ) {
        filteredItemsNameC.add(item.nameproduct.toString());
        filteredItemsDesC.add(item.description.toString());
        filteredItemsCatC.add(item.category!.name.toString());
        filteredItemsImagesC.add(item.images!.toList());
      }
      update();
    });
  }
 */
///////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////
  Future<String?> uploadToCloudinary(File? imageFile) async {
    try {
      final dio = Dio();
      final apiKey = '872948247576765';
      final uploadPreset = 'EventManagement';

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile!.path,
            filename: '$imageFile'),
        'upload_preset': uploadPreset,
        'api_key': apiKey,
      });

      final response = await dio.post(
        'https://api.cloudinary.com/v1_1/elaa/image/upload',
        data: formData,
      );
      print("ttttttttttttttttttttttt${imageFile.path}");
      if (response.statusCode == 200) {
        final secureUrl = response.data['secure_url'];
        print(" URL ${secureUrl}");
        AccountInfoStorage.saveImage("$secureUrl");

        return secureUrl;
      }
    } catch (e) {
      print('Error uploading to Cloudinary: $e');
    }
    return null;
  }

////////////////////////////////////////////////////////////////////////////////
  List<File>? imagefiles;
  List<String?> uploadedUrls = [];

  Future<List<String?>> uploadMultiImagesToCloudinary(
      List<File> imageFiles) async {
    print("uploadMultiImagesToCloudinary");
    for (var imageFile in imageFiles) {
      print("for boucle");
      try {
        print("try condition");

        final dio = Dio();
        final apiKey =
            '872948247576765'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });
        print("ressponse dio");
        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );
        print("if ressponse status");

        if (response.statusCode == 200) {
          final secureUrl = await response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
          AccountInfoStorage.saveProductListImage(uploadedUrls);
          update();
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }

  openImages() async {
    print("openfunction");
    final pickerImages =
        MultipleImagesPicker.pickImages(maxImages: 6, enableCamera: true);

    try {
      var pickedAssets = await pickerImages;
      print(
          "picked images =========================================>$pickedAssets");

      if (pickedAssets.isNotEmpty) {
        List<File> pickedFiles = [];
        for (var asset in pickedAssets) {
          final ByteData byteData = await asset.getByteData();
          final List<int> imageData = byteData.buffer.asUint8List();
          final File file = File(
              '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}.png');
          await file.writeAsBytes(imageData);
          pickedFiles.add(file);
        }

        imagefiles = pickedFiles;
        print("files === ${pickedFiles}");
        print("files === ${pickerImages}");

        await uploadMultiImagesToCloudinary(pickedFiles);

        print("Success getting images");
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("Error while picking files: $e");
    }
    update();
  }

/////////////loading image vendor create product
  bool isUploading = false;
  void uploadImage() async {
    print('uploadimage------------------');
    isUploading = true;
    print('isUploading------------------$isUploading');
    update();
    await openImages();
    print('isUploading------------------$isUploading');
    update();
    isUploading = false;
    print('isUploading------------------$isUploading');
    isUpload = true;
    update();
  }
////////////////////////////////////////////////////read image list
  ///
  ///
  ///
  ///

  /*  final List<String> imgList = ["${AccountInfoStorage.readProductListImage()}"];


final List<Widget>  imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${imgList.indexOf(item)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
    
///////////////multiple
/*   Future<List<String?>> uploadMultiImagesToCloudinary(
      List<XFile> imageFiles) async {
    List<String> uploadedUrls = [];
    print("uploadMultiImagesToCloudinary");
    for (var imageFile in imageFiles) {
      try {
        final dio = Dio();
        final apiKey = 'your_api_key'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });

        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          final secureUrl = response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
          AccountInfoStorage.saveProductListImage(uploadedUrls);
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }
 */
  /* final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  Future<List<String?>> uploadMultiImagesToCloudinary(
      List<XFile> imageFiles) async {
    List<String> uploadedUrls = [];
    print("uploadMultiImagesToCloudinary");
    for (var imageFile in imageFiles) {
      try {
        final dio = Dio();
        final apiKey = 'your_api_key'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });

        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          final secureUrl = response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
          AccountInfoStorage.saveProductListImage(uploadedUrls);
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;

        uploadMultiImagesToCloudinary(pickedfiles.cast<XFile>());
        AccountInfoStorage.readProductListImage();
        print("success get images");
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }
 */
}
 */
}
