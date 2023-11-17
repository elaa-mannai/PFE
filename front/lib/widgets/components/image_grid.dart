import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/widgets/components/multiple_image.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_dropdown_services_choices.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:get/get.dart';
import 'package:front/widgets/custom_text.dart';

class CustomMultiImageChange extends GetView<ProductsController> {
  final Function? function;
  const CustomMultiImageChange({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            controller.productDescriptionController.clear();
            controller.productNameController.clear();
            controller.productPriceController.clear();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(fontSize: 18, text: 'New product'),
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Spacer(flex: 2),
            GetBuilder<ProductsController>(builder: (controller) {
              return Expanded(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          //product title
                          CustomInputText(
                            controller: controller.productNameController,
                            obscureText: false,
                            label: "Product Name:",
                          ),
                          //description
                          CustomInputText(
                            controller: controller.productDescriptionController,
                            obscureText: false,
                            label: "Description:",
                          ),
                          //location dropdownlist
                          CustomInputText(
                            controller: controller.productPriceController,
                            obscureText: false,
                            label: "Price:",
                          ),
                          //addimages
              
                          MultipleImage(),
              
                          //categories
                          CustomDropdownServices(),
                        ],
                      ),
                    ),
                   
                   
                    CustomButton(
                      text: 'Create new product',
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
                              title: Text("Confirme creation",
                                  style: TextStyle(color: AppColor.secondary)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    print(
                                        "========================== product creation ======");
                                    controller.createProduct();
                                    controller.productDescriptionController
                                        .clear();
                                    controller.productNameController.clear();
                                    controller.productPriceController.clear();
                                    
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK',
                                      style:
                                          TextStyle(color: AppColor.goldColor)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
              
                    
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}





/* 

        AlertDialog(
                title: Text("New Service to sell",
                    style: TextStyle(color: AppColor.goldColor)),
                backgroundColor: Colors.white,
                content: 




                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.secondary, fontSize: 20),
                    ),
                    onPressed: () {
                      print(
                          "========================== product creation ======");
                      controller.createProduct();
                      controller.productDescriptionController.clear();
                      controller.productNameController.clear();
                      controller.productPriceController.clear();
                      Navigator.of(context).pop();

                      //  Get.to(ServiceDetails());
                    },
                  ),
                ],
              ),
       */