import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/views/vendors/home_view_vendor.dart';
import 'package:front/views/vendors/service_details.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_dropdown_list.dart';
import 'package:front/widgets/custom_dropdown_services_choices.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:get/get.dart';
import 'package:front/widgets/custom_text.dart';

class CustomMultiImageChange extends GetView<ProductsController> {
  final Function? function;
  const CustomMultiImageChange({Key? key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ImageCloudinary imageCloudinary = ImageCloudinary();

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
              controller.imagefiles = null;
              Get.to(HomeViewVendor());
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
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: CustomBackgroungImage(
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
                                controller:
                                    controller.productDescriptionController,
                                obscureText: false,
                                label: "Description:",
                              ),
                              //price
                              CustomInputText(
                                controller: controller.productPriceController,
                                obscureText: false,
                                label: "Price:",
                              ),
                              SizedBox(height: 10),
                              //location dropdownlist
                              CustomDropdownList(),
                              SizedBox(height: 10),

                              //categories
                              CustomDropdownServices(),
                              SizedBox(height: 10),

                              //addimages
                              GetBuilder<ProductsController>(
                                  builder: (controller) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        //open button ----------------
                                        CustomButton(
                                            backgroundColor: AppColor.secondary,
                                            height: 50,
                                            // width: 300,
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            function: () {
                                              controller.uploadImage();
                                            },
                                            text: "Select Images"),

                                        if (controller.isUploading)
                                          Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                'Uploading images...',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.secondary),
                                              ),
                                              SizedBox(height: 10),
                                              CircularProgressIndicator(
                                                  color: AppColor
                                                      .secondary), // Loading indicator
                                            ],
                                          ),

                                        // Display selected images
                                        (controller.isUploading == false) &&
                                                (controller.imagefiles != null)
                                            ? Wrap(
                                                children: controller.imagefiles!
                                                    .map(
                                                      (imageone) => Container(
                                                        child: Card(
                                                          child: Container(
                                                            height: 100,
                                                            width: 100,
                                                            child: Image.file(
                                                                File(imageone
                                                                    .path)),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              )
                                            : Container(),
                                      ],
                                    ));
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        ////
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.goldColor,
          foregroundColor: Colors.white,
          shape: BeveledRectangleBorder(),
          onPressed: () {
            print("alert dialog");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return controller.isUpload
                    ? AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("Confirme creation",
                            style: TextStyle(color: AppColor.secondary)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (controller.isUpload) {
                                controller.createProduct();
                                controller.productDescriptionController.clear();
                                controller.productNameController.clear();
                                controller.productPriceController.clear();
                                controller.imagefiles = null;
                                Navigator.of(context).pop();
                                Get.to(ServiceDetails());
                                controller.getAllProductByUserId();
                                print(
                                    "-------------------product creation---------------");
                              } else {
                                Navigator.of(context).pop();
                                print(
                                    "==========================wait for image upload ======");
                              }
                            },
                            child: Text('OK',
                                style: TextStyle(color: AppColor.goldColor)),
                          ),
                        ],
                      )
                    : AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("wait for image upload",
                            style: TextStyle(color: AppColor.secondary)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (controller.isUpload) {
                                controller.createProduct();
                                controller.productDescriptionController.clear();
                                controller.productNameController.clear();
                                controller.productPriceController.clear();
                                controller.imagefiles = null;
                                Navigator.of(context).pop();
                                Get.to(ServiceDetails());
                                controller.getAllProductByUserId();
                                print(
                                    "-------------------product creation---------------");
                              } else {
                                Navigator.of(context).pop();
                                print(
                                    "==========================wait for image upload ======");
                              }
                            },
                            child: Text('OK',
                                style: TextStyle(color: AppColor.goldColor)),
                          ),
                        ],
                      );
              },
            );
          },
          // icon: Icon(Icons.add_outlined),
          label: Text(
            'Create new product',
          ),
        ));
  }
}
