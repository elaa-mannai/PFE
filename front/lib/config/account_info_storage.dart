import 'package:front/config/storage.dart';

class AccountInfoStorage {
  static const keyTokenUser = "tokenUser";

  static const keyId = "id";
  static const keyname = "name";
  static const keyemail = "email";
  static const keyitems = "items";
  static const Keyimage = "image";
  static const KeyPassword = "password";
  static const KeyphoneNumber = "phoneNumber";
  static const keyadresse = "adresse";
  static const keyfcmtoken = "fcmtoken";

  static const keyusersnumber = "usersnumber";

  static const keyproductId = "productId";
  static const keyprodcutName = "prodcutName";
  static const keyprodcutPrice = "prodcutPrice";
  static const keyprodcutImage = "prodcutImage";
  static const keyprodcutListImage = "prodcutListImage";
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
  static const keyFavoriteUser = "favoriteUser";

  static const keyDemandeId = "demandeId";
  static const keyDemandeState = "demandeState";
  static const keyDemandeUser = "demandeUser";
  static const keyDemandeVendor = "demandeVendor";
  static const keyLenghtDemandeByVendorAndState =
      "LenghtDemandeByVendorAndState";

  static const keySendorId = "sendorId";
  static const keyRecieverId = "recieverId";
  static const keyChatId = "chatId";

  static saveTokenUser(String? tokenUser) {
    SecureStorage.writeSecureData(key: keyTokenUser, value: tokenUser!);
  }

  static String? readTokenUser() {
    return SecureStorage.readSecureData(keyTokenUser);
  }

  static saveFCMTokenUser(String? fcmtoken) {
    SecureStorage.writeSecureData(key: keyfcmtoken, value: fcmtoken!);
  }

  static String? readFCMTokenUser() {
    return SecureStorage.readSecureData(keyfcmtoken);
  }

  static saveusersnumber(String? usersnumber) {
    SecureStorage.writeSecureData(key: keyusersnumber, value: usersnumber!);
  }

  static String? readusersnumber() {
    return SecureStorage.readSecureData(keyusersnumber);
  }

  static saveId(String? id) {
    SecureStorage.writeSecureData(key: keyId, value: id!);
  }

  static String? readId() {
    return SecureStorage.readSecureData(keyId);
  }

  static deleteUserId() {
    print("deleted user id ");
    return SecureStorage.deleteSecureData(keyId);
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

  static saveAdresse(String? adresse) {
    SecureStorage.writeSecureData(key: keyadresse, value: adresse!);
  }

  static String? readAdresse() {
    return SecureStorage.readSecureData(keyadresse);
  }

  static savePhoneNumber(String? phoneNumber) {
    SecureStorage.writeSecureData(key: KeyphoneNumber, value: phoneNumber!);
  }

  static String? readPhoneNumber() {
    return SecureStorage.readSecureData(KeyphoneNumber);
  }

  static saveItems(String? items) {
    SecureStorage.writeSecureData(key: keyitems, value: items!);
  }

  static String? readItems() {
    return SecureStorage.readSecureData(keyitems);
  }

  static deleteItems() {
    print("deleted user items ");
    return SecureStorage.deleteSecureData(keyitems);
  }

  static saveImage(String? image) {
    SecureStorage.writeSecureData(key: Keyimage, value: image!);
  }

  static String? readImage() {
    return SecureStorage.readSecureData(Keyimage);
  }

  static deleteImage() {
    print("deleted user image ");
    return SecureStorage.deleteSecureData(Keyimage);
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

  static deleteProductId() {
    print("deleted");
    return SecureStorage.deleteSecureData(keyproductId);
  }

  static saveProductName(String? prodcutName) {
    SecureStorage.writeSecureData(key: keyprodcutName, value: prodcutName!);
  }

  static String? readProductName() {
    return SecureStorage.readSecureData(keyprodcutName);
  }

  static deleteProductName() {
    print("deleted");
    return SecureStorage.deleteSecureData(keyprodcutName);
  }

  static saveProductPrice(String? prodcutPrice) {
    SecureStorage.writeSecureData(key: keyprodcutPrice, value: prodcutPrice!);
  }

  static String? readProductPrice() {
    return SecureStorage.readSecureData(keyprodcutPrice);
  }

  static deleteProductPrice() {
    print("deleted");
    return SecureStorage.deleteSecureData(keyprodcutPrice);
  }

  static saveProductImage(String? prodcutImage) {
    SecureStorage.writeSecureData(key: keyprodcutImage, value: prodcutImage!);
  }

  static saveProductListImage(List<dynamic?> prodcutListImage) {
    SecureStorage.writeSecureListData(
        key: keyprodcutListImage, value: prodcutListImage!);
  }

  static deleteProductListImage() {
    print("deleted");
    return SecureStorage.deleteSecureData(keyprodcutListImage);
  }

  static List<dynamic?> readProductListImage() {
    print("readed");
    return SecureStorage.readSecureListData(keyprodcutListImage);
  }

  static saveProductDescription(String? prodcutDescription) {
    SecureStorage.writeSecureData(
        key: keyprodcutDescription, value: prodcutDescription!);
  }

  static String? readProductDescription() {
    return SecureStorage.readSecureData(keyprodcutDescription);
  }

  static deleteProductDescription() {
    print("deleted");
    return SecureStorage.deleteSecureData(keyprodcutDescription);
  }

  static saveProductLocal(String? productLocal) {
    SecureStorage.writeSecureData(key: keyproductLocal, value: productLocal!);
  }

  static String? readProductLocal() {
    return SecureStorage.readSecureData(keyproductLocal);
  }

  static deleteProductLocal() {
    print("deleted");
    return SecureStorage.deleteSecureData(keyproductLocal);
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

  static deleteCategorieId() {
    print("deleted");
    return SecureStorage.deleteSecureData(keycategorieId);
  }

  static deleteCategorieName() {
    print("deleted");
    return SecureStorage.deleteSecureData(keycategorieName);
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

  static saveDemandeId(String? demandeId) {
    SecureStorage.writeSecureData(key: keyDemandeId, value: demandeId!);
  }

  static String? readDemandeId() {
    return SecureStorage.readSecureData(keyDemandeId);
  }

  static saveDemandeState(String? demandeState) {
    SecureStorage.writeSecureData(key: keyDemandeState, value: demandeState!);
  }

  static String? readDemandeState() {
    return SecureStorage.readSecureData(keyDemandeId);
  }

  static saveDemandeUser(String? demandeUser) {
    SecureStorage.writeSecureData(key: keyDemandeUser, value: demandeUser!);
  }

  static String? readDemandeUser() {
    return SecureStorage.readSecureData(keyDemandeUser);
  }

  static saveDemandeVendor(String? demandeVendor) {
    SecureStorage.writeSecureData(key: keyDemandeVendor, value: demandeVendor!);
  }

  static String? readDemandeVendor() {
    return SecureStorage.readSecureData(keyDemandeVendor);
  }

  static saveLenghtDemandeByVendorAndState(
      String? LenghtDemandeByVendorAndState) {
    SecureStorage.writeSecureData(
        key: keyLenghtDemandeByVendorAndState,
        value: LenghtDemandeByVendorAndState!);
  }

  static String? readLenghtDemandeByVendorAndState() {
    return SecureStorage.readSecureData(keyLenghtDemandeByVendorAndState);
  }

   static saveSendorId(String? sendorId) {
    SecureStorage.writeSecureData(key: keySendorId, value: sendorId!);
  }

  static String? readSendorId() {
    return SecureStorage.readSecureData(keySendorId);
  }

   static saveRecieverId(String? recieverid) {
    SecureStorage.writeSecureData(key: keyRecieverId, value: recieverid!);
  }

  static String? readRecieverId() {
    return SecureStorage.readSecureData(keyRecieverId);
  }

   static deleteRecieverId() {
    print("deleted reciever id ");
    return SecureStorage.deleteSecureData(keyRecieverId);
  }
  
   static saveChatId(String? chatId) {
    SecureStorage.writeSecureData(key: keyChatId, value: chatId!);
  }

  static String? readChatId() {
    return SecureStorage.readSecureData(keyChatId);
  }

 static deleteChatId() {
    print("deleted reciever id ");
    return SecureStorage.deleteSecureData(keyChatId);
  }


}
