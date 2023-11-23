import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_button_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custom_text_password.dart';
import 'package:get/get.dart';

class SettingView extends StatefulWidget {
  SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool valuefirst = true;
  bool valuesecond = false;
  bool valuetherd = false;
  bool valueFour = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    ProfileColntroller controller = ProfileColntroller();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'Setting',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButtonText(
                  text: "Change Password",
                  fontsize: 20,
                  fontsizeweight: FontWeight.w400,
                  icon: Icons.arrow_forward_ios_outlined,
                  function: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text("Change Password",
                                style: TextStyle(color: AppColor.secondary)),
                            content: Column(
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      GetBuilder<ProfileColntroller>(
                                          builder: (controller) {
                                        return CustomTextPassword(
                                          text: "Old password",
                                          //controller.isVisiblePassword,
                                          controller:
                                              controller.oldpasswordController,
                                          validator: (input) {
                                            if (input!.isEmpty) {
                                              print('input is empty');
                                              return controller
                                                  .oldpasswordController.text;
                                            }
                                            if (AccountInfoStorage
                                                    .readPassword() !=
                                                controller.oldpasswordController
                                                    .text) {
                                              print(
                                                  "Old password do not match ${controller.oldpasswordController.text}");
                                              return 'Old password do not match';
                                            }
                                            return null;
                                          },
                                          iconData: controller.confirmPassword2
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          obscureText:
                                              controller.confirmPassword2,
                                          function: () {
                                            controller.showConfirmPassword2();
                                          },
                                        );
                                      }),
                                      GetBuilder<ProfileColntroller>(
                                          builder: (controller) {
                                        return CustomTextPassword(
                                          text: "New Password",
                                          controller:
                                              controller.newpasswordcontroller,
                                          iconData: controller.confirmPassword1
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          obscureText:
                                              controller.confirmPassword1,
                                          function: () {
                                            controller.showConfirmPassword1();
                                          },
                                          validator: (input) {
                                            if (input!.isEmpty) {
                                              return 'chek your password';
                                            }
                                            if (input.length < 6) {
                                              return 'password must b >6';
                                            }
                                            if (!input.contains(
                                                new RegExp(r'[A-Z]'))) {
                                              return 'Password must contain at least one uppercase letter';
                                            }
                                            if (!input.contains(
                                                new RegExp(r'[a-z]'))) {
                                              return 'Password must contain at least one lowercase letter';
                                            }
                                            if (!input.contains(
                                                new RegExp(r'[0-9]'))) {
                                              return 'Password must contain at least one numeric digit';
                                            }
                                            if (!input.contains(new RegExp(
                                                r'[!@#$%^&*(),.?":{}|<>]'))) {
                                              return 'Password must contain at least one special character';
                                            }
                                            return null;
                                          },
                                        );
                                      }),
                                      GetBuilder<ProfileColntroller>(
                                          builder: (controller) {
                                        return CustomTextPassword(
                                          text: "Confirm new Password",
                                          controller: controller
                                              .confirmPasswordController,
                                          iconData: controller.confirmPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          obscureText:
                                              controller.confirmPassword,
                                          validator: (input) {
                                            if (controller
                                                    .confirmPasswordController
                                                    .text !=
                                                controller.newpasswordcontroller
                                                    .text) {
                                              print("pass do not match");
                                              return 'pass do not match';
                                            }
                                            return null;
                                          },
                                          function: () {
                                            controller.showConfirmPassword();
                                          },
                                        );
                                      }),
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
                                              backgroundColor: Colors.white,
                                              title: Text(
                                                  "Do you want to delete this event?",
                                                  style: TextStyle(
                                                      color:
                                                          AppColor.goldColor)),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      'No, Keep old password',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .deepOrangeAccent)),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      print(
                                                          'validate form password++++++++++++++++++++++');
                                                      controller
                                                          .updatepasswordUser();
                                                    }
                                                    // controller.deleteEvent(
                                                    //     '${controller.eventByIdJson!.data!.sId}');
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK, Update New!',
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
              CustomButtonText(
                text: "Delete account",
                fontsize: 20,
                fontsizeweight: FontWeight.w400,
                icon: Icons.arrow_forward_ios_outlined,
                function: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text("Do you want to delete your account?",
                              style: TextStyle(color: AppColor.goldColor)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No, Keep It!',
                                  style: TextStyle(
                                      color: Colors.deepOrangeAccent)),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.deleteUser();
                                controller.usernameController.clear();
                                controller.passwordController.clear();
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes, Delete It!',
                                  style: TextStyle(color: AppColor.secondary)),
                            ),
                          ],
                        );
                      });
                },
              )
            ],
          )
          /*  */
          ),
    );
  }
}
