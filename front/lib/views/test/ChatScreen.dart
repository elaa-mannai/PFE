import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/chat_controller.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends GetView<ChatController> {

   const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white , //your color
        surfaceTintColor: AppColor.white ,
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
                itemCount: controller.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return BubbleSpecialThree(
                    text: controller.messages[index],
                    color: AppColor.secondary,
                    tail: true,
                    textStyle: TextStyle(color: AppColor.white , fontSize: 16),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageController,
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
                     controller.createChat();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
