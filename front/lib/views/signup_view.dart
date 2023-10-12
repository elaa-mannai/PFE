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
                    )),
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
                      fontsizeweight: FontWeight.bold,
                      function: () {
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
                          } else
                            return null;
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
                      child: GetBuilder<ProfileColntroller>(builder: (controller) {
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
            ), //footer
      
      
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  //text
                  CustomText(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      text: 'Sign up with',
                      textAlign: TextAlign.center),
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
