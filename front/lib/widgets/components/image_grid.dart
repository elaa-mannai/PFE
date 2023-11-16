import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/widgets/components/multiple_image.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_dropdown_services_choices.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:get/get.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

class CustomMultiImageChange extends StatelessWidget {
  final Function? function;
  const CustomMultiImageChange({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            GetBuilder<ProductsController>(builder: (controller) {
              return Column(
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