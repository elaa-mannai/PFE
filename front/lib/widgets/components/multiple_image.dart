import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/image_cloudinary.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path/path.dart';

class MultipleImage extends StatefulWidget {
  @override
  State<MultipleImage> createState() => _MultipleImageState();
}

class _MultipleImageState extends State<MultipleImage> {
  ProductsController productsController = ProductsController();
  ImageCloudinary imageCloudinary = ImageCloudinary();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //open button ----------------
            CustomButton(
                backgroundColor: AppColor.secondary,
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                function: () {
                  imageCloudinary.openImages();
                },
                text: "Open Images"),

            imageCloudinary.imagefiles != null
                ? Wrap(
                    children: imageCloudinary.imagefiles!.map((imageone) {
                      return Container(
                          child: Card(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.file(File(imageone.path)),
                        ),
                      ));
                    }).toList(),
                  )
                : Container()
          ],
        ));
  }
}
