import 'package:front/config/account_info_storage.dart';
import 'package:front/config/dio_singleton.dart';
import 'package:front/models/json/abstract_json_resource.dart';

abstract class ApiManager {
  DioSingleton dioSingleton = DioSingleton();
  //methode conteint url
  String apiUrl();
  //data
  AbstractJsonResource datajson(data);
  ////////////post data/////////

  Future<AbstractJsonResource?> postData(dataToPost) async {
    var data;
    print('*****************post data****************');
    //print('+++++++++++++++++++++++$dataToPost++++++++++++++++++++++++++++');
    AbstractJsonResource? json;

    return await dioSingleton.dio
        .post(apiUrl(), data: dataToPost)
        .then((value) {
      print("post data************ $value");
      data = value.data;
      json = datajson(data);
      print('json==================----------------------');
      return json;
    }).onError((error, stackTrace) {
      print('error  post DATA=========> $error');
    });
  }

  Future<AbstractJsonResource?> getData({dataToGet}) async {
    var data;
    print('*****************get data****************');
    AbstractJsonResource? json;
    try {
      return await dioSingleton.dio
          .get(apiUrl(), queryParameters: dataToGet)
          .then((value) {
        data = value.data;
        print('data=====================================>$data');
        json = datajson(data);
        return json;
      });
    } catch (error) {
      print('error get data=========> $error');
    }
    
  }

  Future<AbstractJsonResource?> getDataByName({dataToGet}) async {
    var data;
    print('*****************get data by name****************');
    Map<String, dynamic> data_ = {
      "name": AccountInfoStorage.readCategorieName(),
    };
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .get(apiUrl(), queryParameters: data_)
        .then((value) {
      data = value.data;
      json = datajson(data);
      return json;
    }).onError((error, stackTrace) {
      print('error  getDataByName=========> $error');
    });
  }

  Future<AbstractJsonResource?> getDataByState({dataToGetByState}) async {
    var data;
    print('*****************get data by state****************');
    Map<String, dynamic> data_ = {
      "state": AccountInfoStorage.readFavoriteState(),
    };
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .get(apiUrl(), queryParameters: data_)
        .then((value) {
      data = value.data;
      json = datajson(data);
      return json;
    }).onError((error, stackTrace) {
      print('error getDataByState=========> $error');
    });
  }

  Future<AbstractJsonResource?> getDataByUserIdAndState(
      {dataToGetByUserIdAndState}) async {
    var data;
    print('*****************get Data By User Id And State****************');
    Map<String, dynamic> data_ = {
      "state": "true",
      "user": AccountInfoStorage.readId(),
    };
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .get(apiUrl(), queryParameters: data_)
        .then((value) {
      data = value.data;
      json = datajson(data);
      return json;
    }).onError((error, stackTrace) {
      print('error getDataByUserIdAndState=========> $error');
    });
  }

  Future<AbstractJsonResource?> updateData(dataUpdate) async {
    print('*****************update data****************');
    var data;
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .patch(apiUrl(), data: dataUpdate)
        .then((value) {
      data = value.data;
      json = datajson(data);
      return json;
    }).onError((error, stackTrace) {
      print('error updatedata=========> $error');
    });
  }

  Future<AbstractJsonResource?> deleteData({dataDelete}) async {
    print('*****************delete data****************');
    Map<String, dynamic> data_ = {
      "sId": AccountInfoStorage.readGuestId(),
    };
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .delete(apiUrl(), queryParameters: data_)
        .then((value) {
      return json;
    }).onError((error, stackTrace) {
      print('error delete data =========> $error, $dataDelete');
    });
  }
}
