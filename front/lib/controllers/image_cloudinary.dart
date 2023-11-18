import 'dart:io';
import 'dart:typed_data';

import 'package:cloudinary/cloudinary.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageCloudinary extends GetxController {
  Future<String?> uploadToCloudinary(File? imageFile) async {
    try {
      final dio = Dio();
      final apiKey = '872948247576765';
      final uploadPreset = 'EventManagement';

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile!.path,
            filename: '$imageFile'),
        'upload_preset': uploadPreset,
        'api_key': apiKey,
      });

      final response = await dio.post(
        'https://api.cloudinary.com/v1_1/elaa/image/upload',
        data: formData,
      );
      print("ttttttttttttttttttttttt${imageFile.path}");
      if (response.statusCode == 200) {
        final secureUrl = response.data['secure_url'];
        print(" URL ${secureUrl}");
        AccountInfoStorage.saveImage("$secureUrl");

        return secureUrl;
      }
    } catch (e) {
      print('Error uploading to Cloudinary: $e');
    }
    return null;
  }

////////////////////////////////////////////////////////////////////////////////
  List<File>? imagefiles;
  List<String?> uploadedUrls = [];

  Future<List<String?>> uploadMultiImagesToCloudinary(
      List<File> imageFiles) async {
    print("uploadMultiImagesToCloudinary");
    for (var imageFile in imageFiles) {
      print("for boucle");
      try {
        print("try condition");

        final dio = Dio();
        final apiKey = '872948247576765'; // Replace with your Cloudinary API key
        final uploadPreset =
            'EventManagement'; // Replace with your Cloudinary upload preset

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(imageFile.path,
              filename: '${imageFile.path}'),
          'upload_preset': uploadPreset,
          'api_key': apiKey,
        });
        print("ressponse dio");
        final response = await dio.post(
          'https://api.cloudinary.com/v1_1/elaa/image/upload',
          data: formData,
        );
        print("if ressponse status");

        if (response.statusCode == 200) {
          final secureUrl = await response.data['secure_url'];
          print("Uploaded image URL: $secureUrl");
          uploadedUrls.add(secureUrl);
          AccountInfoStorage.saveProductListImage(uploadedUrls);
          update();
        }
      } catch (e) {
        print('Error uploading to Cloudinary: $e');
      }
    }

    return uploadedUrls;
  }

  openImages() async {
    print("openfunction");
    final pickerImages =
        MultipleImagesPicker.pickImages(maxImages: 6, enableCamera: true);

    try {
      var pickedAssets = await pickerImages;
      print(
          "picked images =========================================>$pickedAssets");

      if (pickedAssets.isNotEmpty) {
        List<File> pickedFiles = [];
        for (var asset in pickedAssets) {
          final ByteData byteData = await asset.getByteData();
          final List<int> imageData = byteData.buffer.asUint8List();
          final File file = File(
              '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}.png');
          await file.writeAsBytes(imageData);
          pickedFiles.add(file);

        }

          imagefiles = pickedFiles;
        print("files === ${pickedFiles}");
        print("files === ${pickerImages}");

        await uploadMultiImagesToCloudinary(pickedFiles);

        print("Success getting images");
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("Error while picking files: $e");
    }
    update();
  }

////////////////////////////////////////////////////read image list
  ///
  ///
  ///
  ///

 /*  final List<String> imgList = ["${AccountInfoStorage.readProductListImage()}"];


final List<Widget>  imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${imgList.indexOf(item)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
    
///////////////multiple
/*   Future<List<String?>> uploadMultiImagesToCloudinary(
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
 */
  /* final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
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
}
 */
}
