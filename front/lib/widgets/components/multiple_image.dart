import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/image_cloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path/path.dart';

class MultipleImage extends StatefulWidget {
  @override
  State<MultipleImage> createState() => _MultipleImageState();
}

class _MultipleImageState extends State<MultipleImage> {
  ProductsController productsController = ProductsController();
 /* final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  ImageCloudinary imageCloudinary = ImageCloudinary();

   Future<List<String?>> uploadMultiImagesToCloudinary(
      List<XFile> imageFiles) async {
    List<String> uploadedUrls = [];
    print("uploadMultiImagesToCloudinary");
    for (var imageFile in imageFiles) {
      try {
        final dio = Dio();
        final apiKey = 'your_api_key'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });

        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          final secureUrl = response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
          AccountInfoStorage.saveProductListImage(uploadedUrls);
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }

   openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;

        uploadMultiImagesToCloudinary(pickedfiles.cast<XFile>());
        AccountInfoStorage.readProductListImage();
        print("success get images");
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }
*/

  ImageCloudinary imageCloudinary = ImageCloudinary();

  Future<List<String?>> uploadMultiImagesToCloudinary(
      List<File> imageFiles) async {
    List<String?> uploadedUrls = [];
    print("uploadMultiImagesToCloudinary");
    for (var imageFile in imageFiles) {
      try {
        final dio = Dio();
        final apiKey = 'your_api_key'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });

        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          final secureUrl = response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
          AccountInfoStorage.saveProductListImage(uploadedUrls);
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }

  List<File>? imagefiles;

  openImages() async {
    print("openfunction");
    final pickerImages = MultipleImagesPicker.pickImages(maxImages: 5);

    try {
      var pickedFiles = await pickerImages;
      print("picked images");

      if (pickedFiles != null) {
        imagefiles = pickedFiles.cast<File>();
        print("files === ${pickedFiles}");
        print("files === ${pickerImages}");
        // Uncomment the following lines if needed
        // uploadMultiImagesToCloudinary(pickedFiles.cast<File>());
        // AccountInfoStorage.readProductListImage();
        print("Success getting images");
      } else {
        print("No image is selected.");
      }
      // Ensure that `update()` is defined or imported correctly
      // update();
    } catch (e) {
      print("Error while picking files: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //open button ----------------
            ElevatedButton(
                onPressed: () {
                  openImages();
                },
                child: Text("Open Images")),

          /*   imagefiles != null
                ? Wrap(
                    children: imagefiles!.map((imageone) {
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
                : Container() */
          ],
        ));
  }
}
