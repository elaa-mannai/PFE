import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:dio/dio.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

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
