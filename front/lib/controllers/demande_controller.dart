import 'package:front/config/account_info_storage.dart';
import 'package:front/models/json/demande_by_user_id_and_state_json.dart';
import 'package:front/models/json/demande_create_json.dart';
import 'package:front/models/json/demande_get_all_json.dart';
import 'package:front/models/json/demande_get_by_id_json.dart';
import 'package:front/models/network/api_demande_by_user_id_and_state.dart';
import 'package:front/models/network/api_demande_create.dart';
import 'package:front/models/network/api_demande_get.dart';
import 'package:front/models/network/api_demande_get_by_id.dart';
import 'package:get/get.dart';

class DemandeController extends GetxController {
  ApiDemande apiDemande = ApiDemande();
  ApiDemandeGetAll apiDemandeGetAll = ApiDemandeGetAll();
  ApiDemandeGetById apiDemandeGetById = ApiDemandeGetById();
  ApiDemandeByUserIdAndState apiDemandeByUserIdAndState =
      ApiDemandeByUserIdAndState();

  GetDemandeByIdJson? getDemandeByIdJson;
  GetAllDemandeJson? getAllDemandeJson;
  CreateDemandeJson? createDemandeJson;
  DemandeByUserIdAndStateJson? demandeByUserIdAndStateJson;

  createDemande() {
    print("------------------create demande -------------------");
    Map<String, dynamic> data = {
      "state": false,
      "users": AccountInfoStorage.readId(),
      "products": AccountInfoStorage.readProductId(),
      "events": AccountInfoStorage.readEventId(),
    };
    print("create demande function");
    apiDemande.postData(data).then((value) {
      createDemandeJson = value as CreateDemandeJson?;
      getDemande();
      update();
    }).onError((error, stackTrace) {
      print('error create demande ==========> $error');
    });
  }

  getDemande() {
    return apiDemandeGetAll.getData().then((value) {
      getAllDemandeJson = value as GetAllDemandeJson?;
      if (getAllDemandeJson!.data != null) {
        return getAllDemandeJson;
      }
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
}
