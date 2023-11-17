import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/box_messages.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_image_change.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

class ProfileView extends GetView<ProfileColntroller> {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUserById();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.goldColor,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
              //code to execute when this button is pressed
            }),
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                text: ' Profile',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            /*    mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
           */
            children: [
              Container(
                child: Stack(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //chat Box with Vendors
                            Column(
                              children: [
                                CircleAvatar(
                                  //radius: 30,
                                  minRadius: 15,
                                  maxRadius: 30,
                                  backgroundColor: AppColor.goldColor,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.chat,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Get.to(BoxMessages());
                                    },
                                  ),
                                ),
                                CustomText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  text: "Message Box",
                                ),
                              ],
                            ),
                            // profile pic
                            Expanded(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    minRadius: 50,
                                    maxRadius: 70,
                                    child: CustomImageChange(
                                      function: () {},
                                    ),
                                  ),
                                  //get name from backend
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      AccountInfoStorage.readName().toString(),
                                      style: TextStyle(
                                        color:
                                            AppColor.goldColor.withOpacity(1),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // phone number
                            Column(
                              children: [
                                CircleAvatar(
                                  minRadius: 15,
                                  maxRadius: 30,
                                  backgroundColor: AppColor.goldColor,
                                  child: Icon(
                                    Icons.call,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  text: "Phonebook",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Expanded(
                  child: Column(
                    children: [
                      CustomInputText(
                        label: 'User Name',
                        iconData: Icons.person,
                        obscureText: false,
                        controller: controller.usernameController,
                      ),
                      CustomInputText(
                        label: 'Email',
                        iconData: Icons.email,
                        obscureText: false,
                        controller: controller.emailController,
                      ),
                      CustomInputText(
                        label: 'Phone number',
                        iconData: Icons.phone,
                        obscureText: false,
                        controller: controller.phonenumberController,
                      ),
                      CustomInputText(
                        label: 'Adresse',
                        iconData: Icons.location_city,
                        obscureText: false,
                        controller: controller.adresseController,
                      ),
                      CustomButton(
                        text: 'Update',
                        width: MediaQuery.sizeOf(context).width/2,
                        height: 50,
                        backgroundColor: AppColor.goldColor,
                        function: () {
                          //controller.userUpdate();
                          print("alert dialog");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text("Confirme changes", style: TextStyle(color: AppColor.secondary)),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      controller.userUpdate();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK', style: TextStyle(color: AppColor.goldColor)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
