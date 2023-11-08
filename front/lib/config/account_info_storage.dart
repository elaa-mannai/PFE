import 'package:front/config/storage.dart';

class AccountInfoStorage {
  static const keyTokenUser = "tokenUser";

  static const keyId = "id";
  static const keyname = "name";
  static const keyemail = "email";
  static const keyitems = "items";
  static const Keyimage = "image";
  static const KeyPassword = "password";

  static const keyproductId = "productId";
  static const keyprodcutName = "prodcutName";
  static const keyprodcutPrice = "prodcutPrice";
  static const keyprodcutImage = "prodcutImage";
  static const keyprodcutDescription = "prodcutDescription";
  static const keyproductLocal = "productLocal";

  static const keycategorieId = "categorieId";
  static const keycategorieName = "categorieName";
  static const keycategorieProduct = "categorieProduct";

  static const keyeventId = "eventId";
  static const keyeventTitle = "eventTitle";
  static const keyeventDescription = "eventDescription";
  static const keyeventDatedebut = "eventDatedebut";
  static const keyeventDatefin = "eventDatefin";
  static const keyeventLocation = "eventLocation";

  static const keyguestId = "guestId";
  static const keyguestName = "guestName";
  static const keyguestPhonenumber = "guestPhonenumber";
  static const keyguestEvent = "guestEvent";

  static const keyFavoriteId = "favoriteId";
  static const keyFavoriteState = "favoriteState";
  static const keyFavoriteUser = "keyFavoriteUser";

  static saveTokenUser(String? tokenUser) {
    SecureStorage.writeSecureData(key: keyTokenUser, value: tokenUser!);
  }

  static String? readTokenUser() {
    return SecureStorage.readSecureData(keyTokenUser);
  }

  static saveId(String id) {
    SecureStorage.writeSecureData(key: keyId, value: id);
  }

  static String? readId() {
    return SecureStorage.readSecureData(keyId);
  }

  static saveName(String name) {
    SecureStorage.writeSecureData(key: keyname, value: name);
  }

  static String? readName() {
    return SecureStorage.readSecureData(keyname);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyemail, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyemail);
  }

  static saveItems(String? items) {
    SecureStorage.writeSecureData(key: keyitems, value: items!);
  }

  static String? readItems() {
    return SecureStorage.readSecureData(keyitems);
  }

  static saveImage(String? image) {
    SecureStorage.writeSecureData(key: Keyimage, value: image!);
  }

  static String? readImage() {
    return SecureStorage.readSecureData(Keyimage);
  }

  static savePassword(String? password) {
    SecureStorage.writeSecureData(key: KeyPassword, value: password!);
  }

  static String? readPassword() {
    return SecureStorage.readSecureData(KeyPassword);
  }

  static saveProductId(String? productId) {
    SecureStorage.writeSecureData(key: keyproductId, value: productId!);
  }

  static String? readProductId() {
    return SecureStorage.readSecureData(keyproductId);
  }

  static saveProductName(String? prodcutName) {
    SecureStorage.writeSecureData(key: keyprodcutName, value: prodcutName!);
  }

  static String? readProductName() {
    return SecureStorage.readSecureData(keyprodcutName);
  }

  static saveProductPrice(String? prodcutPrice) {
    SecureStorage.writeSecureData(key: keyprodcutPrice, value: prodcutPrice!);
  }

  static String? readProductPrice() {
    return SecureStorage.readSecureData(keyprodcutPrice);
  }

  static saveProductImage(String? prodcutImage) {
    SecureStorage.writeSecureData(key: keyprodcutImage, value: prodcutImage!);
  }

  static String? readProductImage() {
    return SecureStorage.readSecureData(keyprodcutImage);
  }

  static saveProductDescription(String? prodcutDescription) {
    SecureStorage.writeSecureData(
        key: keyprodcutDescription, value: prodcutDescription!);
  }

  static String? readProductDescription() {
    return SecureStorage.readSecureData(keyprodcutDescription);
  }

  static saveProductLocal(String? productLocal) {
    SecureStorage.writeSecureData(key: keyproductLocal, value: productLocal!);
  }

  static String? readProductLocal() {
    return SecureStorage.readSecureData(keyproductLocal);
  }

  static saveCatgorieName(String? categorieName) {
    SecureStorage.writeSecureData(key: keycategorieName, value: categorieName!);
  }

  static String? readCategorieName() {
    return SecureStorage.readSecureData(keycategorieName);
  }

  static saveCatgorieId(String? categorieId) {
    SecureStorage.writeSecureData(key: keycategorieId, value: categorieId!);
  }

  static String? readCategorieId() {
    return SecureStorage.readSecureData(keycategorieId);
  }

  static saveCatgorieProducts(String? categorieProducts) {
    SecureStorage.writeSecureData(
        key: keycategorieProduct, value: categorieProducts!);
  }

  static String? readCategorieProducts() {
    return SecureStorage.readSecureData(keycategorieProduct);
  }

  static saveEventId(String? eventId) {
    SecureStorage.writeSecureData(key: keyeventId, value: eventId!);
  }

  static String? readEventId() {
    return SecureStorage.readSecureData(keyeventId);
  }

  static saveEventDescription(String? eventDescription) {
    SecureStorage.writeSecureData(
        key: keyeventDescription, value: eventDescription!);
  }

  static String? readEventDescription() {
    return SecureStorage.readSecureData(keyeventDescription);
  }

  static saveEventTitle(String? eventTitle) {
    SecureStorage.writeSecureData(key: keyeventTitle, value: eventTitle!);
  }

  static String? readEventTitle() {
    return SecureStorage.readSecureData(keyeventId);
  }

  static saveEventDatedebut(String? eventDatedebut) {
    SecureStorage.writeSecureData(
        key: keyeventDatedebut, value: eventDatedebut!);
  }

  static String? readEventDatedebut() {
    return SecureStorage.readSecureData(keyeventDatedebut);
  }

  static saveEventDatefin(String? eventDatefin) {
    SecureStorage.writeSecureData(key: keyeventDatefin, value: eventDatefin!);
  }

  static String? readEventDatefin() {
    return SecureStorage.readSecureData(keyeventDatefin);
  }

  static saveEventLocation(String? eventLocation) {
    SecureStorage.writeSecureData(key: keyeventLocation, value: eventLocation!);
  }

  static String? readEventLocation() {
    return SecureStorage.readSecureData(keyeventLocation);
  }

  static saveGuestId(String? guestId) {
    SecureStorage.writeSecureData(key: keyguestId, value: guestId!);
  }

  static String? readGuestId() {
    return SecureStorage.readSecureData(keyguestId);
  }

  static saveGuestName(String? guestName) {
    SecureStorage.writeSecureData(key: keyguestName, value: guestName!);
  }

  static String? readGuestName() {
    return SecureStorage.readSecureData(keyguestName);
  }

  static saveGuestPhonenumber(String? guestPhonenumber) {
    SecureStorage.writeSecureData(
        key: keyguestPhonenumber, value: guestPhonenumber!);
  }

  static String? readGuestPhonenumber() {
    return SecureStorage.readSecureData(keyguestPhonenumber);
  }

  static saveGuestEvent(String? guestEvent) {
    SecureStorage.writeSecureData(key: keyguestEvent, value: guestEvent!);
  }

  static String? readGuestEvent() {
    return SecureStorage.readSecureData(keyguestEvent);
  }

  static saveFavoriteId(String? favoriteId) {
    SecureStorage.writeSecureData(key: keyFavoriteId, value: favoriteId!);
  }

  static String? readFavoriteId() {
    return SecureStorage.readSecureData(keyFavoriteId);
  }

  static saveFavoriteState(String? favoriteState) {
    SecureStorage.writeSecureData(key: keyFavoriteState, value: favoriteState!);
  }

  static String? readFavoriteState() {
    return SecureStorage.readSecureData(keyFavoriteId);
  }

  static saveFavoriteUser(String? favoriteUser) {
    SecureStorage.writeSecureData(key: keyFavoriteUser, value: favoriteUser!);
  }

  static String? readFavoriteUser() {
    return SecureStorage.readSecureData(keyFavoriteUser);
  }
}
