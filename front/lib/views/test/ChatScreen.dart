import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/chat_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/models/json/chat_get_all_json.dart';
import 'package:front/models/json/chat_json.dart';
import 'package:front/models/network/api_chat_create_new.dart';
import 'package:front/models/network/api_chat_get_all_by_user_customer_ids.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

///////problem 
///
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ProfileColntroller profileColntroller = ProfileColntroller();
  ChatController chatController = ChatController();

  IO.Socket? socket;
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];
  GetAllChatJson? getAllChatJson;
  CreateNewChatJson? createNewChatJson;

  ApiAllChatByUserAndCustomerIDs apiAllChatByUserAndCustomerIDs =
      ApiAllChatByUserAndCustomerIDs();
  ApiNewChat apiNewChat = ApiNewChat();

  @override
  void initState() {
    super.initState();
    connectToServer();
    listenToMessages();
  }

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

  void sendMessage() {
    print("------------------create demande -------------------");
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      socket!.emit('message', message);
      messageController.clear();
    }

    Map<String, dynamic> messages = {
      'message': message,
      'sender': AccountInfoStorage.readId().toString(),
      'receiver': AccountInfoStorage.readDemandeVendor().toString(),
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

  void listenToMessages() {
    socket!.on('message', (data) {
      //   final messageText = data['message']; // Extract message content
      print('data message========> $data');
      setState(() {
        messages.add(data);
        // Add the message to the list
      });
      print('list message =======>$messages');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title:  Column(
          /*     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          */
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: AccountInfoStorage.readRecieverId().toString(),
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,//chatController.chatById!.data!.messages!.length,
                itemBuilder: (BuildContext context, int index) {
                  return BubbleSpecialThree(
                    text:  messages[index],
                    color: AppColor.secondary,
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      // hintStyle: TextStyle(color: AppColor.secondary),
                      filled: true, // Set to true to enable background color
                      fillColor: AppColor.goldColor,
                      enabledBorder: InputBorder.none,
                      // labelStyle: TextStyle(color: Colors.amber)
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: AppColor.goldColor,
                    ),
                    onPressed: () {
                      sendMessage();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
