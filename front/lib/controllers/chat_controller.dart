import 'package:flutter/widgets.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/models/json/chat_SenderIDAndRecieverId_json.dart';
import 'package:front/models/json/chat_by_id_json.dart';
import 'package:front/models/json/chat_by_user_id.dart';
import 'package:front/models/json/chat_get_all_json.dart';
import 'package:front/models/json/chat_json.dart';
import 'package:front/models/network/api_chat_create_new.dart';
import 'package:front/models/network/api_chat_get_all_by_user_customer_ids.dart';
import 'package:front/models/network/api_chat_get_by_id.dart';
import 'package:front/models/network/api_chat_get_by_user_id.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';

class ChatController extends GetxController {
  GetAllChatJson? getAllChatJson;
  GetChatById? chatById;
  CreateNewChatJson? createNewChatJson;
  GetChatByUserId? getChatByUserId;
  SenderIDAndRecieverIdJson? senderIDAndRecieverIdJson;
  ApiChatGetById apiChatGetById = ApiChatGetById();
  ApiChatByUserId apiChatByUserId = ApiChatByUserId();
  ApiAllChatByUserAndCustomerIDs apiAllChatByUserAndCustomerIDs =
      ApiAllChatByUserAndCustomerIDs();
  ApiNewChat apiNewChat = ApiNewChat();

  @override
  void onInit() {
    super.onInit();
    // Fetch initial data on controller initialization
    connectToServer();
    listenToMessages();
  }

  createChat() {
    print("------------------create demande -------------------");
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      socket!.emit('message', message);
      messageController.clear();
    }

    Map<String, dynamic> messages = {
      'message': message,
      'sender': AccountInfoStorage.readId().toString(),
      'reciever': AccountInfoStorage.readDemandeVendor().toString(),
      'time': DateTime.now().millisecondsSinceEpoch,
    };

    print("create demande function");
    apiNewChat.postData(messages).then((value) {
      createNewChatJson = value as CreateNewChatJson?;
      socket!.emit('sendNewMessage', messages);

      print("mmmmm $messages");
      // sendNotificationChat();
      // getChatByUserAndCustomerIDs();
      // update();
    }).onError((error, stackTrace) {
      print('error create demande ==========> $error');
    });
  }

  void sendMessage() {
    print("------------------create demande -------------------");
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      socket!.emit('message', message);
      messageController.clear();
    }

     Map<String, dynamic> messages = {
      'messages': [message],
      'sender': AccountInfoStorage.readId().toString(),
      'reciever': AccountInfoStorage.readDemandeVendor().toString(),
      'time': DateTime.now().millisecondsSinceEpoch,
    };

    print("create demande function");
    apiNewChat.postData(messages).then((value) {
      createNewChatJson = value as CreateNewChatJson?;
      print('createNewChatJson$value');
      socket!.emit('sendNewMessage', messages);

      print("mmmmm $messages");
      // sendNotificationChat();
      // getChatByUserAndCustomerIDs();
      // update();
    }).onError((error, stackTrace) {
      print('error create demande ==========> $error');
    });
  }

  ProductsController productsController = ProductsController();
  ProfileColntroller profileColntroller = ProfileColntroller();
  IO.Socket? socket;
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  void connectToServer() {
    socket = IO.io('ws://${AppApi.ip}/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('Connection established');
    });
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));
  }

  /*  void sendMessage() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      socket!.emit('message', message);
      messageController.clear();
    }

    Map<String, dynamic> messages = {
      'message': message,
      'sender': AccountInfoStorage.readId().toString(),
      'receiver': AccountInfoStorage.readDemandeVendor(),
      // 'time': DateTime.now().millisecondsSinceEpoch,
    };

    socket!.emit('sendNewMessage', messages);

     print("mmmmm $messages");

    // print("list messages ${messages.length}");
  } */

  void listenToMessages() {
    socket!.on('message', (data) {
      //   final messageText = data['message']; // Extract message content
      print('data message========> $data');
      messages.add(data);
      print('list message =======>$messages');
    });
  }

  getchatuserId() {
    print("function getchatuserId");
    apiChatByUserId.idS = AccountInfoStorage.readId().toString();
    return apiChatByUserId.getData().then((value) {
      print("success getchatuserId");
      getChatByUserId = value as GetChatByUserId;
      if (getChatByUserId!.data != null) {
        return getChatByUserId!;
      }
      print(
          "data length getchatuserId =================== ${getChatByUserId!.data!.length}");
      update();
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return getChatByUserId!;
    });
  }

  getchatSenderIDAndRecieverId() {
    print("senderIDAndRecieverIdJson  function");
    apiAllChatByUserAndCustomerIDs.idS = AccountInfoStorage.readId().toString();
    apiAllChatByUserAndCustomerIDs.idR =
        AccountInfoStorage.readDemandeVendor().toString();
    return apiAllChatByUserAndCustomerIDs.getData().then((value) {
      print("success get chatsenderIDAndRecieverIdJson");
      senderIDAndRecieverIdJson = value as SenderIDAndRecieverIdJson?;
      if (senderIDAndRecieverIdJson!.data != null) {
        return senderIDAndRecieverIdJson!;
      }
      print(
          "data length chat =================== ${senderIDAndRecieverIdJson!.data!.length}");
      update();
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return senderIDAndRecieverIdJson!;
    });
  }

  getChatbyId() {
    print("function success get chat by id");
    apiChatGetById.id = AccountInfoStorage.readChatId().toString();
    return apiChatGetById.getData().then((value) {
      print("success get chat by id");
      chatById = value as GetChatById?;
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${chatById!.data!.messages}');
      if (chatById!.data != null) {
        print("null check");
        return chatById!;
      }
      print(
          "data messages chat =================== ${chatById!.data!.messages}");
      update();
      return null;
    }).onError((error, stackTrace) {
      print("error ==== $error");
      return chatById!;
    });
  }
}
