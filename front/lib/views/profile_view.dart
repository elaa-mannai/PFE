import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/box_messages.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_button_text.dart';
import 'package:front/widgets/custom_dropdown_list.dart';
import 'package:front/widgets/custom_image_change.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custom_text_password.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ProfileView extends GetView<ProfileColntroller> {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    ProfileColntroller controller = ProfileColntroller();
    controller.getUserById();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert_outlined),
              tooltip: 'Show Snackbar',
              color: AppColor.secondary,
              splashColor: AppColor.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColor.white,
                    content: CustomButtonText(
                        size: 10,
                        text: "Change Password",
                        fontsize: 20,
                        fontsizeweight: FontWeight.w400,
                        icon: Icons.arrow_forward_ios_outlined,
                        function: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: AppColor.white,
                                  title: Text("Change Password",
                                      style:
                                          TextStyle(color: AppColor.secondary)),
                                  content: Column(
                                    children: [
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            GetBuilder<ProfileColntroller>(
                                                builder: (controller) {
                                              return CustomTextPassword(
                                                controller: controller
                                                    .newpasswordcontroller,
                                                text: 'Password',
                                                iconData:
                                                    controller.isVisiblePassword
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                obscureText: controller
                                                    .isVisiblePassword,
                                                function: () {
                                                  print(
                                                      "${controller.newpasswordcontroller}");

                                                  print(
                                                      '********click password*********');
                                                  controller.showPassword();
                                                },
                                                validator: (input) {
                                                  if (input!.isEmpty) {
                                                    return 'chek your password';
                                                  }
                                                  if (input.length < 6) {
                                                    return 'password must b >6';
                                                  }
                                                  /* if (!input.contains(new RegExp(r'[A-Z]'))) {
                                return 'Password must contain at least one uppercase letter';
                              }
                              if (!input.contains(new RegExp(r'[a-z]'))) {
                                return 'Password must contain at least one lowercase letter';
                              }
                              if (!input.contains(new RegExp(r'[0-9]'))) {
                                return 'Password must contain at least one numeric digit';
                              }
                              if (!input.contains(
                                  new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                return 'Password must contain at least one special character';
                              } */
                                                  return null;
                                                },
                                              );
                                            }),
                                            GetBuilder<ProfileColntroller>(
                                              builder: (controller) {
                                                return CustomTextPassword(
                                                  controller: controller
                                                      .confirmPasswordController,
                                                  text: 'Confirm Password',
                                                  iconData:
                                                      controller.confirmPassword
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                  obscureText: controller
                                                      .confirmPassword,
                                                  validator: (input) {
                                                    if (controller
                                                            .confirmPasswordController
                                                            .text !=
                                                        controller
                                                            .newpasswordcontroller
                                                            .text) {
                                                      print(
                                                          "pass do not match");
                                                      return 'pass do not match';
                                                    }
                                                    return null;
                                                  },
                                                  function: () {
                                                    controller
                                                        .showConfirmPassword();
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomButton(
                                        backgroundColor: AppColor.goldColor,
                                        height: 50,
                                        width: MediaQuery.sizeOf(context).width,
                                        text: "Change Password",
                                        function: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    title: Text(
                                                        "Do you want to change your password?",
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .goldColor)),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                            'No, Keep old password',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepOrangeAccent)),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          print(controller
                                                              .newpasswordcontroller);
                                                          print(controller
                                                              .confirmPasswordController);
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            print(
                                                                'validate form password++++++++++++++++++++++');
                                                            controller
                                                                .updatepasswordUser();
                                                            Get.to(HomeView());
                                                          }
                                                          // controller.deleteEvent(
                                                          //     '${controller.eventByIdJson!.data!.sId}');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                            'OK, Update New!',
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .secondary)),
                                                      ),
                                                    ]);
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                  ),
                );
              })
        ],
        iconTheme: IconThemeData.fallback(),
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
        backgroundColor: AppColor.white, //your color
        surfaceTintColor: AppColor.white,
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
                                      color: AppColor.white,
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
                                    color: AppColor.white,
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
                        specifykeyboard: TextInputType.number,
                        controller: controller.phonenumberController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomDropdownList(),
                      /* CustomInputText(
                        label: 'Adresse',
                        iconData: Icons.location_city,
                        obscureText: false,
                        controller: controller.adresseController,
                      ), */
                      CustomButton(
                        text: 'Update',
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 50,
                        backgroundColor: AppColor.goldColor,
                        function: () {
                          //controller.userUpdate();
                          print("alert dialog");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppColor.white,
                                title: Text("Confirme changes",
                                    style:
                                        TextStyle(color: AppColor.goldColor)),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.userUpdate();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK',
                                        style: TextStyle(
                                            color: AppColor.goldColor)),
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
