import 'package:front/config/account_info_storage.dart';

class AppApi {
  static const String baseUrl = "http://$ip/";

   // static const String ip = "192.168.3.55:3000";
  //static const String ip = "localhost:3000";
   static const String ip = "192.168.1.11:3000";

  static const String loginUrl = "${baseUrl}auth/signin";
  static const String signupUrl = "${baseUrl}users/";
  static const String getUserByIdUrl = "${baseUrl}users/";
  static String updatePasswordUrl =
      "${baseUrl}auth/updatepassword/${AccountInfoStorage.readId().toString()}";
  //static const String getImageUser = "${baseUrl}file/users/";
  static const String deleteUserUrl = "${baseUrl}users/";

  static const String getEventByUserUrl = "${baseUrl}events/user/";
  static const String createEventUrl = "${baseUrl}events/";
  static const String getEventUrl = "${baseUrl}events/";
  static const String deleteEventUrl = "${baseUrl}events/";

  static const String createFactureUrl = "${baseUrl}factures/";

  static const String getCategoriesUrl = "${baseUrl}categories/";
  static const String getCategorieByNameUrl = "${baseUrl}categories/getbyname";

  static const String createProductsUrl = "${baseUrl}products";
  static const String getProductsUrl = "${baseUrl}products/";
  static const String getProductsByUserUrl = "${baseUrl}products/user/";
  static const String getProductsBycategorieIdUrl =
      "${baseUrl}products/category/";
  static const String deleteProductUrl = "${baseUrl}products/";

  static const String createGuestUrl = "${baseUrl}guests";
  static const String getGuestsUrl = "${baseUrl}guests/";
  static const String getGuestsByUserIdUrl = "${baseUrl}guests/user/";
  static const String getGuestsByEventIdUrl = "${baseUrl}guests/event/";
  static const String deleteGuestUrl = "${baseUrl}guests/";

  static const String createFavoriteUrl = "${baseUrl}favorites/";
  static const String getFavoriteAll = "${baseUrl}favorites/";
  static const String deleteFavoriteUrl = "${baseUrl}favorites/";
  static const String getFavoriteByUserIdUrl = "${baseUrl}favorites/user/";
  static const String getFavoriteByStateUrl = "${baseUrl}favorites/state/";

  static const String getFavoriteByUserIdAndStateUrl =
      "${baseUrl}favorites/stateAndUserId/";
// static String getFavoriteByUserIdAndStatepath(String id, String state) {
//     return '$getFavoriteByUserIdAndStateUrl$id/$state';
//   }

  static const String createDemande = "${baseUrl}demande/";
  static const String getAllDemande = "${baseUrl}demande/";
  static const String getDemandeById = "${baseUrl}demande/";
  static const String getDemandeByUserId = "${baseUrl}demande/user";
  static const String getDemandeByStateId = "${baseUrl}demande/state";
  static const String getDemandeByUserIdAndStateUrl =
      "${baseUrl}demande/stateAndUserId/";

  static const String Logout = "${baseUrl}auth/logout";

  /* 
  String baseUrlCloudinary =
      'https://API Key:872948247576765 _Rl01bDk9GpGQnjqM_YSsLNT2bQ@api.cloudinary.com/v1_1/elaa/resources/image';
 */
}
