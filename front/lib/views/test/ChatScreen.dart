import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_api.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ProfileColntroller profileColntroller = ProfileColntroller();
  IO.Socket? socket;
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

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
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      socket!.emit('message', message);
      messageController.clear();
    }

    // Map<String, dynamic> messages = {
    //   'message': message,
    //   // 'senderId': profileColntroller.loginUserJson!.user!.sId,
    //   /* 'receiverId': receiverId,
    // */
    //   // 'time': DateTime.now().millisecondsSinceEpoch,
    // };
    // socket!.emit('sendNewMessage', messages);

    // print("mmmmm $messages");

    // print("list messages ${messages.length}");
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
        title: const Column(
          /*     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          */
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'vendor name',
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
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return BubbleSpecialThree(
                    text: messages[index],
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
