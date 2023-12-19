import 'dart:convert';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/models/json/login_user_json.dart';
import 'package:front/models/json/user_all_json.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/json/user_update_password_json.dart';
import 'package:front/models/network/api_get_user_by_id.dart';
import 'package:front/models/network/api_loginn.dart';
import 'package:front/models/network/api_signup.dart';
import 'package:front/models/network/api_user_all.dart';
import 'package:front/models/network/api_user_delete.dart';
import 'package:front/models/network/api_user_update_password.dart';
import 'package:front/views/admin/home_view_admin.dart';
import 'package:front/views/favorite_view.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/views/login_view.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/views/signup_view.dart';
import 'package:front/views/vendors/home_view_vendor.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;

class ProfileColntroller extends GetxController {
  Dio dio1 = Dio();

  LoginUserJson? loginUserJson;
  UsersAllJson? usersAllJson;
  ApiUserAll? apiUserAll;
  ApiLoginn apiLoginn = ApiLoginn();
  ApiUserById apiUserById = ApiUserById();
  UserGetByIdJson? userGetByIdJson;
  ApiSignup apisignup = ApiSignup();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController confirmUpdatePassword = TextEditingController();

  TextEditingController itemscontroller = TextEditingController();
  bool passwordsMatch = true;
  bool isVisiblePassword = true;
  bool confirmPassword = true;
  bool confirmPassword1 = true;
  ProductsController productsControlle = ProductsController();
  void viderControllers() {
    confirmPasswordController.text = '';
  }

  dio.Dio dio_ = dio.Dio(
    dio.BaseOptions(
      baseUrl: AppApi.baseUrl,
      //  receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 6000),
      receiveTimeout: Duration(seconds: 6000),
      headers: <String, String>{
        //'Contentt-Type': 'application/x-www-form-urlencoded',
        //  'Content-Type': 'application/json',
        'Content-Type': 'multipart/form-data',
      },
    ),
  );

  @override
  void onInit() {
    //logOut();

    //createEvent();
    // Initialisations spécifiques à ce contrôleur
    super
        .onInit(); // N'oubliez pas d'appeler super.onInit() pour respecter le cycle de vie de GetX.
  }

  String InputValidator() {
    print('Validate password');

    if (usernameController.text.isEmpty) {
      print('Name should not be empty');
    } else {
      GetUtils.isLengthGreaterThan(usernameController.text, 6)
          ? print('Name is valid')
          : print('Name is invalid, user name need 6 caracters or more!!!');
    }
    GetUtils.isEmail(emailController.text)
        ? print('Email is valid')
        : print('Email is invalid!!!');

    GetUtils.isNull(itemscontroller.text)
        ? print('role isn`t selected')
        : print('role is selected');
    // return "$itemscontroller";

    if (confirmPasswordController.text.isEmpty &&
        passwordController.text.isEmpty) {
      print("pass is empty");
      return 'pass is empty';
      // passwordsMatch = true;
    } else if (confirmPasswordController.text == passwordController.text) {
      print("pass do match");
      return 'pass do match';
      // passwordsMatch = true;
    } else {
      print("pass does not match");
      return 'pass does not match';
      //passwordsMatch = false;
    }
  }

  void showPassword() {
    print('show password');
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  void showConfirmPassword1() {
    confirmPassword1 = !confirmPassword1;
    update();
  }

  void showConfirmPassword() {
    print('confirm password');
    confirmPassword = !confirmPassword;
    update();
    // rebuild
  }

//////////////////////////calendar selection /////////////////////

  String? date;
  Future checkValueMembers() async {
    await getData();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    date = sharedPreferences.getString("data");
    print('get $date');
  }

  saveData(String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("data", date);
    print('save$date');
  }

  DateTime selectedDate = DateTime.now(); // Initialize with the current date

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) print("$picked");
    selectedDate = picked!;
  }

  ////////////////////image/////////////////////////
  File? profilePicFile;
  Future<void> directUpdateImage(File? file) async {
    if (file == null) return;

    profilePicFile = file;
    print(
        "------------------------------------Image $file------------------------------------");
    productsController.uploadToCloudinary(file);

    update();
  }

  ProductsController productsController = ProductsController();
  // ImageCloudinary imageCloudinary = ImageCloudinary();

  // List<Products>? favProducts;

  signIn() {
    print("----------------signin-----------------");
    apiLoginn.postData({
      "username": usernameController.text,
      "password": passwordController.text,
    }).then((value) {
      print('success signin------------------------}');
      loginUserJson = value as LoginUserJson?;
      AccountInfoStorage.saveId(loginUserJson!.user!.sId.toString());
      AccountInfoStorage.saveEmail(loginUserJson!.user!.email.toString());
      AccountInfoStorage.saveName(loginUserJson!.user!.username.toString());
      AccountInfoStorage.saveImage(loginUserJson!.user!.image.toString());
      AccountInfoStorage.saveItems(loginUserJson!.user!.items.toString());
      AccountInfoStorage.savePhoneNumber(loginUserJson!.user!.phone.toString());
      AccountInfoStorage.saveAdresse(loginUserJson!.user!.adress.toString());
      AccountInfoStorage.savePassword(passwordController.text);

      // AccountInfoStorage.saveFavoriteId(
      //     loginUserJson!.user!.favorites!.toString());

      //AccountInfoStorage.saveImage(loginUserJson!.user!.image);
      AccountInfoStorage.saveTokenUser(loginUserJson!.tokens!.accessToken);

      updateFCMToken();
      viderControllers();
      update();

      //   print('password===========================>${passwordController.text}');
      print('success signin');
      if (loginUserJson!.user!.items == "Customer") {
        print('Customer');
        AccountInfoStorage.readImage();

        Get.to(HomeView());
      } else if (loginUserJson!.user!.items == "Vendor") {
        print('Vendor');
        AccountInfoStorage.readImage();

        Get.to(HomeViewVendor());
      } else {
        print('Admin');
        AccountInfoStorage.readImage();
        Get.to(HomeViewAdmin());
      }
    }).onError((error, stackTrace) {
      ///// modifier ui /////////////
      Get.snackbar(
        "",
        " User Name or Password Does not match",
        backgroundColor: AppColor.goldColor,
        titleText: Text(
          "Sothing went wrong",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      );
      print('erro login=====================> $error');
    });
    update();
  }

  ////////////function signup /////////////////
  signup() {
    //InputValidator();
    print('*******************signup*********************');
    Map<String, dynamic> data = {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'items': AccountInfoStorage.readItems(),
    };
    apisignup.postData(data).then((value) {
      print('success');

      userGetByIdJson = value as UserGetByIdJson?;
      print('id user==========> ${userGetByIdJson!.data!.sId}');
      print('role user==========> ${userGetByIdJson!.data!.items}');
      //   AccountInfoStorage.saveImage(userGetByIdJson!.data!.image);
      //  print('role image==================> ${AccountInfoStorage.readImage()}');
      viderControllers();

      print('success');
      if (userGetByIdJson!.data!.items == "Customer") {
        print('Customer');
        Get.to(LoginView());
      } else if (userGetByIdJson!.data!.items == "Vendor") {
        print('Vendor');

        Get.to(LoginView());
      } else {
        Get.to(HomeViewAdmin());
      }
    }).onError((error, stackTrace) {
      print('error signup======> $error');
    });
  }

////////////function getinfouser /////////////////

  getUserById() async {
    print('get user by id----------------------------------');
    apiUserById.id = AccountInfoStorage.readId().toString();

    apiUserById.getData().then((value) {
      print('value user id =====>$value');
      userGetByIdJson = value as UserGetByIdJson?;
      print(
          'get user by id success==============================>${userGetByIdJson!.data!.email!.toString()}');
      usernameController.text = userGetByIdJson!.data!.username!.toString();
      emailController.text = userGetByIdJson!.data!.email!.toString();
      adresseController.text = userGetByIdJson!.data!.adress!.toString();
      phonenumberController.text = userGetByIdJson!.data!.phone!.toString();
      adresseController.text = userGetByIdJson!.data!.adress!.toString();
      imageController.text = userGetByIdJson!.data!.image!.toString();
    });
  }

////////////function updateinfouser /////////////////
  userUpdate() {
    apiUserById.id = AccountInfoStorage.readId().toString();
    // AccountInfoStorage.readImage().toString();
    apiUserById.updateData({
      'username': usernameController.text,
      'email': emailController.text,
      'adress': AccountInfoStorage.readProductLocal(),
      'phone': phonenumberController.text,
      'image': AccountInfoStorage.readImage()
    }).then((value) {
      AccountInfoStorage.saveImage(userGetByIdJson!.data!.image.toString());
      print("success");
      // Get.defaultDialog(title: "Alert");
      Get.snackbar("", "Success",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Notification Update",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
    update();
  }

  updatepasswordUser() {
    apiUserUpdatePassword.id = AccountInfoStorage.readId().toString();
    // AccountInfoStorage.readImage().toString();
    apiUserUpdatePassword
        .updateData({'password': newpasswordcontroller.text}).then((value) {
      AccountInfoStorage.savePassword(userUpdatePasswordJson.user!.password.toString());

      print("success password updated");
      Get.snackbar("", "Success",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Passowrd Update",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
    update();
  }

  UserUpdatePasswordJson userUpdatePasswordJson = UserUpdatePasswordJson();
  ApiUserUpdatePassword apiUserUpdatePassword = ApiUserUpdatePassword();
  /* updatepasswordUser()  {
    apiUserUpdatePassword.id = AccountInfoStorage.readId().toString();
        AccountInfoStorage.readTokenUser();

      print("idddddd ${ AccountInfoStorage.readId().toString() } and token ${    AccountInfoStorage.readTokenUser()
}");
    apiUserUpdatePassword
        .updateData({'password': newpasswordcontroller.text,
        'refreshToken':""}).then((value) {
      // print(confirmPasswordController.text);
      print(newpasswordcontroller.text);

      print("success password updated");
      Get.snackbar("", "Success",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Passowrd Update",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });

  }
 */
  resetpasswordUser() async {
    print("Server Response: ");
    dio1.post(AppApi.resetpassword, data: {
      'email': emailController.text,
      // 'newpassword': newpasswordcontroller.text,
    }).then((value) {
      print("Server Response: $value");
      print("success sent email for password updated");
      Get.snackbar("", "Success",
          backgroundColor: AppColor.goldColor,
          titleText: Text(
            "Passowrd Update",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ));
    }).onError((error, stackTrace) {
      print('Error reset password: $error');
      Get.snackbar(
        "",
        "Failed while sending email to reset password. Please try again.",
        backgroundColor: AppColor.redText,
        titleText: Text(
          "Error",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      );
    });
  }

  updateFCMToken() {
    apiUserById.id = AccountInfoStorage.readId().toString();
    // AccountInfoStorage.readImage().toString();
    apiUserById.updateData({
      'FCMToken': AccountInfoStorage.readFCMTokenUser(),
    }).then((value) {
      print("success FCMToken");
      print("fcm${AccountInfoStorage.readFCMTokenUser()}");
    }).onError((error, stackTrace) {
      print('error login======> $error');
    });
    update();
  }

  ApiUserDeleteById apiUserDeleteById = ApiUserDeleteById();
  deleteUser() {
    /////// add a state to desactivation user
    apiUserDeleteById.id = AccountInfoStorage.readId().toString();
    apiUserDeleteById.deleteData().then((value) {
      print('success user delete');
      Get.to(SignupView());
      update();
    }).onError((error, stackTrace) {
      print('erorr delete user === > $error');
    });
    update();
  }

  logOut() {
    print("logout");
    dio1.options.headers['authorization'] =
        'bearer ${AccountInfoStorage.readTokenUser().toString()}';
    dio1.get(AppApi.Logout).then((value) {
      Get.to(LoginView());
      usernameController.clear();
      passwordController.clear();
      // favProducts!.clear();
      // productsControlle.savedFavProd.clear();
      print('logout success');
    }).onError((error, stackTrace) {
      print("erro logout ====> $error");
    });
  }

  //////////////////////////////image upload by cloudinary ///////////////////////////////////////
  /// https://cyuket.medium.com/flutter-how-to-upload-to-cloudinary-cdb7631dfbe1 ///
  ///
  ///
  ///
  ///
  ///
  /// favorite
  ///
  ///

  /* bool? isFavorite;

  void favoriteIcon() {
    print("favorite");
    isFavorite = !isFavorite!;
    update();
  }
 */

  /*  
  loginUserJson!.user!.products!.length
  getAllProductByUserId() {
    print("Product by user id ---------------------");
    apiProductsGetByUserId.id = AccountInfoStorage.readId().toString();
    return apiProductsGetByUserId.getData().then((value) {
      print('value===========> $value');
      //////////the value is null
      productsByUserIdJson = value as ProductsByUserIdJson?;
      print(
          "Product by user id =============== ${productsByUserIdJson!.data![0].user}");
      if (productsByUserIdJson!.data != null) {
        return productsByUserIdJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print('error======> $error');
      return null;
    });
  }
 */
}
