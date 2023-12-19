import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/login_view.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_button_text.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_radio_button.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class SignupView extends GetView<ProfileColntroller> {
  /*  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  */

  //  SignupView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // logo && description
              Column(
                children: [
                  //logo
                  Image.asset('assets/images/logo1.png',
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 3),
                  //description
                  CustomText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    text:
                        'Sign in to plan with us for your event \nto avoid many of the things that used \nto stress you before',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              // text button login&&signup
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //login text button
                  Column(
                    children: [
                      CustomButtonText(
                        text: 'Login',
                        fontsize: 18,
                        icon: Icons.abc,
                        size: 1,
                        fontsizeweight: FontWeight.bold,
                        function: () {
                          controller.usernameController.clear();
                          controller.emailController.clear();
                          controller.passwordController.clear();
                          Get.to(LoginView());
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
                  // sign up text button
                  Column(
                    children: [
                      CustomButtonText(
                        text: 'Sign up',
                        fontsize: 18,
                        icon: Icons.abc,
                        size: 1,
                        fontsizeweight: FontWeight.bold,
                        function: () {
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
                          color: AppColor.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // from text input
              Expanded(
                flex: 3,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomInputText(
                          controller: controller.usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            } else if (value.length < 6) {
                              return "User Name should be atleast 6 characters";
                            } else if (value.length > 15) {
                              return "User Name should not be greater than 15 characters";
                            } // else
                            // return null;
                          },
                          label: 'User Name',
                          iconData: Icons.person,
                          obscureText: false,
                        ),
                      ),

                      Expanded(
                        child: GetBuilder<ProfileColntroller>(
                          builder: (controller) {
                            return CustomInputText(
                              controller: controller.emailController,
                              label: 'Email',
                              iconData: Icons.email,
                              obscureText: false,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return "Required";
                                }
                                if (!EmailValidator.validate(input)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                      ),

                      Expanded(
                        child: GetBuilder<ProfileColntroller>(
                            builder: (controller) {
                          return CustomInputText(
                            controller: controller.passwordController,
                            label: 'Password',
                            iconData: controller.isVisiblePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            obscureText: controller.isVisiblePassword,
                            function: () {
                              print("${controller.passwordController}");

                              print('********click password*********');
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
                      ),

                      Expanded(
                        child: GetBuilder<ProfileColntroller>(
                          builder: (controller) {
                            return CustomInputText(
                              controller: controller.confirmPasswordController,
                              label: 'Confirm Password',
                              iconData: controller.confirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              obscureText: controller.confirmPassword,
                              validator: (input) {
                                if (controller.confirmPasswordController.text !=
                                    controller.passwordController.text) {
                                  print("pass do not match");
                                  return 'pass do not match';
                                }
                                return null;
                              },
                              function: () {
                                controller.showConfirmPassword();
                              },
                            );
                          },
                        ),
                      ),

                      //Roles item selection radio button
                      Expanded(
                        child: GetBuilder<ProfileColntroller>(
                          builder: (controller) {
                            return CustomRadiobutton(
                              controller: controller.itemscontroller,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //sign up button
              CustomButton(
                text: 'Sign up',
                width: 150,
                height: 50,
                backgroundColor: AppColor.secondary,
                function: () {
                  print('****************function signup**************');
                  if (formKey.currentState!.validate()) {
                    print('validate form++++++++++++++++++++++');
                    controller.InputValidator();
                    controller.signup();
                  }
                  //  Get.to(ServiceChoices());
                  // }
                },
              ),

              //footer
              SizedBox(
                height: 20,
              )

              //   Expanded(
              //     flex: 1,
              //     child: Column(
              //       children: [
              //         //text
              //         CustomText(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w400,
              //             text: 'Sign up with',
              //             textAlign: TextAlign.center),
              //         // Login with Facebook or twitter or gmail
              //         Expanded(
              //           flex: 1,
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               GestureDetector(
              //                 onTap: () {
              //                   print("twitter connection!");
              //                 },
              //                 child: Image(
              //                   image: AssetImage('assets/images/twitter.png'),
              //                   width: 35,
              //                   height: 35,
              //                 ),
              //               ),
              //               GestureDetector(
              //                 onTap: () async {
              //                   print("facebook connection!");
              //               /*     try {
              //                     final LoginResult result =
              //                         await FacebookAuth.instance.login();

              //                     if (result.status == LoginStatus.success) {
              //                       // The user has successfully logged in with Facebook
              //                       print(
              //                           'Facebook login successful! User ID: ${result.accessToken!.userId}');
              //                     } else {
              //                       // Facebook login failed
              //                       print(
              //                           'Facebook login failed. Error message: ${result.message}');
              //                     }
              //                   } catch (e) {
              //                     print('Error during Facebook login: $e');
              //                   } */
              //                 },
              //                 child: Image(
              //                   image: AssetImage('assets/images/fb.png'),
              //                   width: 35,
              //                   height: 35,
              //                 ),
              //               ),
              //               GestureDetector(
              //                 onTap: () {
              //                   print("gmail connection!");
              //                 },
              //                 child: Image(
              //                   image: AssetImage('assets/images/gmail.png'),
              //                   width: 35,
              //                   height: 35,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
            ],
          ),
        ),
      ),
    );
  }
}
