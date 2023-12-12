import 'package:cloudinary/cloudinary.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/models/json/demande_by_user_id_and_state_json.dart';
import 'package:front/models/json/demande_by_user_id_json.dart';
import 'package:front/models/json/demande_by_vendir_id_and_state.dart';
import 'package:front/models/json/demande_by_vendor_id_json.dart';
import 'package:front/models/json/demande_create_json.dart';
import 'package:front/models/json/demande_get_all_json.dart';
import 'package:front/models/json/demande_get_by_id_json.dart';
import 'package:front/models/network/api_demande_by_user_id.dart';
import 'package:front/models/network/api_demande_by_user_id_and_state.dart';
import 'package:front/models/network/api_demande_by_vendor_id.dart';
import 'package:front/models/network/api_demande_by_vendor_id_and_state_fasle.dart';
import 'package:front/models/network/api_demande_create.dart';
import 'package:front/models/network/api_demande_get.dart';
import 'package:front/models/network/api_demande_get_by_id.dart';
import 'package:get/get.dart';

class DemandeController extends GetxController {
  Dio dio = Dio();
  ApiDemande apiDemande = ApiDemande();
  ApiDemandeGetAll apiDemandeGetAll = ApiDemandeGetAll();
  ApiDemandeGetById apiDemandeGetById = ApiDemandeGetById();
  ApiDemandeByUserIdAndState apiDemandeByUserIdAndState =
      ApiDemandeByUserIdAndState();
  ApiDemandeByVendorId apiDemandeByVendorId = ApiDemandeByVendorId();
  ApiDemandeByUserId apiDemandeByUserId = ApiDemandeByUserId();

  GetDemandeByIdJson? getDemandeByIdJson;
  DemandeByUserIdJson? demandeByUserIdJson;
  GetAllDemandeJson? getAllDemandeJson;
  CreateDemandeJson? createDemandeJson;
  DemandeByUserIdAndStateJson? demandeByUserIdAndStateJson;

  createDemande() {
    print("------------------create demande -------------------");
    Map<String, dynamic> data = {
      "state": false,
      "users": AccountInfoStorage.readId(),
      "vendor": AccountInfoStorage.readDemandeVendor(),
      "products": AccountInfoStorage.readProductId(),
      "events": AccountInfoStorage.readEventId(),
    };
    print("create demande function");
    apiDemande.postData(data).then((value) {
      createDemandeJson = value as CreateDemandeJson?;
      sendNotificationDemande();
      getDemande();
      update();
    }).onError((error, stackTrace) {
      print('error create demande ==========> $error');
    });
  }

  getDemande() {
    print('all demande');
    return apiDemandeGetAll.getData().then((value) {
      getAllDemandeJson = value as GetAllDemandeJson?;
      if (getAllDemandeJson!.data != null) {
        return getAllDemandeJson;
      }
      update();
      return null;
    }).onError((error, stackTrace) {
      print('error get demande ==========> $error');
      return getAllDemandeJson;
    });
  }

  getDemandeById() {
    apiDemandeGetById.id = AccountInfoStorage.readDemandeId().toString();
    return apiDemandeGetById.getData().then((value) {
      getDemandeByIdJson = value as GetDemandeByIdJson?;
      if (getDemandeByIdJson!.data != null) {
        return getDemandeByIdJson;
      }
      return null;
    }).onError((error, stackTrace) {
      print('error get demande ==========> $error');
      return getDemandeByIdJson;
    });
  }

  getDemandeByUserIdAndStateUrl() async {
    print(
        "-------------------------demandeByUserIdAndStateJson---------------------");
    apiDemandeByUserIdAndState.id = AccountInfoStorage.readId().toString();
    apiDemandeByUserIdAndState.state =
        AccountInfoStorage.readDemandeState().toString();

    try {
      return await apiDemandeByUserIdAndState
          .getDataByUserIdAndState()
          .then((value) {
        print('value demandeByUserIdAndStateJson===========> $value');
        //////////the value is null
        demandeByUserIdAndStateJson = value as DemandeByUserIdAndStateJson?;
        print(
            '----------------------------------------------demande----${demandeByUserIdAndStateJson!.data}');

        if (demandeByUserIdAndStateJson!.data != null) {
          print(
              '++++++++++length++++++++++++${demandeByUserIdAndStateJson!.data!.length}');
          return demandeByUserIdAndStateJson!;
        }

        print(
            '----------------------------------------------demandeByUserIdAndStateJson----');

        update();
      });
    } catch (error) {
      print('error demandeByUserIdAndStateJson======> $error');
    }
  }

  ApiDemandeByVendorIdAndState apiDemandeByVendorIdAndState =
      ApiDemandeByVendorIdAndState();
  DemandeByVendorIdAndStateJson? demandeByVendorIdAndStateJson;
  getDemandeByVendorIdAndStateUrl() async {
    print(
        "-------------------------DemandeByVendorIdAndStateUrl---------------------");
    apiDemandeByVendorIdAndState.id = AccountInfoStorage.readId().toString();
    apiDemandeByVendorIdAndState.state =
        AccountInfoStorage.readDemandeState().toString();

    try {
      return await apiDemandeByVendorIdAndState
          .getDataByUserIdAndState()
          .then((value) {
        print('value DemandeByVendorIdAndStateUrl===========> $value');
        //////////the value is null
        demandeByVendorIdAndStateJson = value as DemandeByVendorIdAndStateJson?;
        print(
            '----------------------------------------------demande----${demandeByVendorIdAndStateJson!.data}');

        if (demandeByVendorIdAndStateJson!.data != null) {
          print(
              '++++++++++length++++++++++++${demandeByVendorIdAndStateJson!.data!.length}');
          
          return demandeByVendorIdAndStateJson!;
        }

        print(
            '----------------------------------------------DemandeByVendorIdAndStateUrl----');

        update();
      });
    } catch (error) {
      print('error DemandeByVendorIdAndStateUrl======> $error');
    }
  }

  getDemandeByUserID() async {
    print("-------------------------demandeByUserIdJson---------------------");
    apiDemandeByUserId.id = AccountInfoStorage.readId().toString();

    try {
      return await apiDemandeByUserId.getData().then((value) {
        print('value demandeByUserIdJson===========> $value');
        //////////the value is null
        demandeByUserIdJson = value as DemandeByUserIdJson?;
        print(
            '----------------------------------------------demande----${demandeByUserIdJson!.data}');

        if (demandeByUserIdJson!.data != null) {
          print(
              '++++++++++length++++++++++++${demandeByUserIdJson!.data!.length}');
          return demandeByUserIdJson!;
        }

        print(
            '----------------------------------------------demandeByUserIdJson----');

        update();
      });
    } catch (error) {
      print('error demandeByUserIdJson======> $error');
    }
  }

  DemandeByVendorIdJson? demandeByVendorIdJson;
  getDemandeByVendorId()  {
    print("-------------------------DemandeByVendorId---------------------");
    apiDemandeByVendorId.id = AccountInfoStorage.readId().toString();
    /*   apiDemandeByVendorId.state =
        AccountInfoStorage.readDemandeState().toString();
 */
    try {
      return  apiDemandeByVendorId.getData().then((value) {
        print('value DemandeByVendorId===========> $value');
        //////////the value is null
        demandeByVendorIdJson = value as DemandeByVendorIdJson?;
        print(
            '----------------------------------------------demande----${demandeByVendorIdJson!.data}');

        if (demandeByVendorIdJson!.data != null) {
          print(
              '++++++++++length++++++++++++${demandeByVendorIdJson!.data!.length}');
          return demandeByVendorIdJson!;
        }

        print(
            '----------------------------------------------demandeByVendorIdJson----');

        update();
      });
    } catch (error) {
      print('error demandeByVendorIdJson======> $error');
    }
  }

////////////// demande update
  ///
  ///
  /* GetDemandeByIdJson? demand;

  Future<void> updateDemandStatus() async {
    if (demand != null) {
      // Check if demand is not null before accessing its properties
      demand!.data!.state = true;
    }
    sendNotificationDemande();
    update();
    getDemandeByUserIdAndStateUrl();
    getDemandeByVendorIdAndStateUrl();
  }
 */
  ///
  ///
  ///
  ///
  /*  bool? isWaiting;

  void waitingIcon() {
    print("Demande Waiting");
    isWaiting = !isWaiting!;
    update();
  }

  bool demandeExiste(
    List<DataDemande> listMap,
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

  updateDemande(bool? demandeState) async {
    apiDemandeGetById.id = AccountInfoStorage.readDemandeId().toString();
    try {
      await apiDemandeGetById.updateData({"state": demandeState}).then((value) {
        print('update success----------------------');

        getDemandeByIdJson = value as GetDemandeByIdJson?;
        AccountInfoStorage.saveFavoriteState(
            "${getDemandeByIdJson!.data!.state}");
      });
      getDemandeByVendorId();
      getDemandeByUserIdAndStateUrl();
      getDemandeByUserID();
      AccountInfoStorage.saveDemandeId(getDemandeByIdJson!.data!.sId);
      getDemande();
      update();
    } catch (error) {
      print('error update demande======> $error');
    }
    update();
  }
 */
////////////////// notif
  /// change the elements of title and body
  sendNotificationDemande() async {
    print("------------------demandenotif----------------------");
    Map<String, dynamic> data = {
      "title": "Notification ",
      "body": "Demande Product",
      //the fcmtokenuser ''vendor'' while the logged in is customer and the inverse to
      "token": AccountInfoStorage.readFCMTokenUser()
    };

    dio.post(AppApi.sendNotif, data: data).then(
      (value) {
        print("success notif demande");
      },
    ).onError((error, stackTrace) {
      print('error create demande ==========> $error');
    });
  }
}
