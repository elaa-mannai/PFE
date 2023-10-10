import 'package:flutter/material.dart';
import 'package:flutter_login/src/models/login_data.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/signup_view.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_button_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custom_text_password.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../widgets/custom_input_text.dart';

class LoginView extends GetView<ProfileColntroller> {
  //final ProfileColntroller profileColntroller = Get.put(ProfileColntroller());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // logo && description
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  //logo
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo1.png',
                        width: 300,
                        height: 150,
                      ),
                    ),
                  ),
                  //description
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text:
                          'Sign in to plan with us for your event \n to avoid many of the things that used \n to stress you before',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            // text button login&&signup
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //login text button
                  Column(
                    children: [
                      CustomButtonText(
                        text: 'Login',
                        fontsize: 18,
                        fontsizeweight: FontWeight.bold,
                        function: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          width: 150,
                          height: 2,
                          color: AppColor.secondary,
                        ),
                      ),
                    ],
                  ),
                  // sign up text button
                  Column(
                    children: [
                      CustomButtonText(
                        text: 'Sign up',
                        fontsize: 18,
                        fontsizeweight: FontWeight.bold,
                        function: () {
                          Get.to(SignupView());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SignupView()));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          width: 150,
                          height: 2,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // from text input
            Expanded(
              flex: 2,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: CustomInputText(
                        controller: controller.usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        label: 'User Name',
                        iconData: Icons.person,
                        obscureText: false,
                      ),
                    ),
                    Expanded(
                      child: GetBuilder<ProfileColntroller>(
                          // init: ProfileColntroller(),
                          builder: (controller) {
                        return CustomInputText(
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          label: 'Password',
                          //if ? else :
                          iconData: controller.isVisiblePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: controller.isVisiblePassword,
                          function: () {
                            print('********click password*********');
                            controller.showPassword();
                          },
                        );
                      }),
                    ),
                    // CustomTextPassword(
                    //   text: "Old password",
                    //   obscureText: controller.isVisiblePassword,
                    //   controller: controller.oldpasswordController,
                    //   validator: (input) {
                    //     if (input!.length < 6) {
                    //       print('input must >6');
                    //       return 'oldpassword must be >6';
                    //     }
                    //     if (controller.passwordController.text !=
                    //         controller.oldpasswordController.text) {
                    //       print(
                    //           "Old password do not match ${controller.oldpasswordController.text}");
                    //       return 'Old password do not match';
                    //     }
                    //   },
                    // ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomButtonText(
                          text: "Forgot Password ?",
                          fontsize: 12,
                          fontsizeweight: FontWeight.w600,
                          function: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<ProfileColntroller>(builder: (c) {
              return CustomButton(
                text: 'Login',
                width: 150,
                height: 50,
                function: () {
                  print(
                      '====================================Function login====================================');
                  if (formKey.currentState!.validate()) {
                    print('validate form++++++++++++++++++++++');
                    //  controller.authUser();
                    print(
                        'usernamse=====> ${controller.usernameController.text}');
                    controller.signIn();
                  }

                  // controller.signInValidator();
                  // controller.signIn();
                  // //
                  //  Get.to(HomeView());
                  /*   if (formKey.currentState!.validate()) {
                    print('validate');
                  } */
                },
                /* );
            } */
              );
            }),
            //footer
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  //text
                  Expanded(
                    flex: 1,
                    child: CustomText(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        text: 'Or\n Sign up with',
                        textAlign: TextAlign.center),
                  ),
                  // Login with Facebook or twitter or gmail
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('assets/images/twitter.png'),
                          width: 35,
                          height: 35,
                        ),
                        Image(
                          image: AssetImage('assets/images/fb.png'),
                          width: 35,
                          height: 35,
                        ),
                        Image(
                          image: AssetImage('assets/images/gmail.png'),
                          width: 35,
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
