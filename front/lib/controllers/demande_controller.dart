import 'package:front/config/account_info_storage.dart';
import 'package:front/models/json/demande_create_json.dart';
import 'package:front/models/json/demande_get_all_json.dart';
import 'package:front/models/json/demande_get_by_id_json.dart';
import 'package:front/models/network/api_demande_create.dart';
import 'package:front/models/network/api_demande_get.dart';
import 'package:front/models/network/api_demande_get_by_id.dart';
import 'package:get/get.dart';

class DemandeController extends GetxController {
  ApiDemande apiDemande = ApiDemande();
  ApiDemandeGetAll apiDemandeGetAll = ApiDemandeGetAll();
  ApiDemandeGetById apiDemandeGetById = ApiDemandeGetById();

  GetDemandeByIdJson? getDemandeByIdJson;
  GetAllDemandeJson? getAllDemandeJson;
  CreateDemandeJson? createDemandeJson;

  createDemande() {
    print("------------------create demande -------------------");
    Map<String, dynamic> data = {
      "state": true,
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
}
