import 'package:editable_image/editable_image.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:get/get.dart';

class CustomImageChange extends StatelessWidget {
  final Function? function;
  const CustomImageChange({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 2),
          GetBuilder<ProfileColntroller>(builder: (controller) {
            return EditableImage(
              // Define the method that will run on
              // the change process of the image.
              onChange: controller.directUpdateImage,

              // Define the source of the image.  imageController
              image:   controller.profilePicFile != null 
                  ?  Image.file(controller.profilePicFile!, fit: BoxFit.cover)
                   : Image.network(
                    AccountInfoStorage.readImage() != null
                      && controller.profilePicFile != null 
                          ? "https://media.istockphoto.com/id/1300845620/fr/vectoriel/appartement-dic%C3%B4ne-dutilisateur-isol%C3%A9-sur-le-fond-blanc-symbole-utilisateur.jpg?s=612x612&w=0&k=20&c=BVOfS7mmvy2lnfBPghkN__k8OMsg7Nlykpgjn0YOHj0="
                          : "${AccountInfoStorage.readImage()}",
                    ),

              // Define the size of EditableImage.
              // size: 100,

              // Define the Theme of image picker.
              imagePickerTheme: ThemeData(
                // Define the default brightness and colors.
                primaryColor: Colors.white,
                //   shadowColor: Colors.transparent,
                colorScheme:
                    const ColorScheme.light(background: Colors.white70),
                iconTheme: const IconThemeData(color: AppColor.goldColor),
                // Define the default font family.
                fontFamily: 'Georgia',
              ),

              // Define the border of the image if needed.
              imageBorder: Border.all(color: AppColor.goldColor, width: 2),

              editIconBorder: Border.all(color: AppColor.goldColor, width: 2),
            );
          })
        ],
      ),
      onTap: () {
        function!();
      },
    );
  }
}
