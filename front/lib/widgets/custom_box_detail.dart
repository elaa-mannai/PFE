import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/models/json/login_user_json.dart';
import 'package:front/views/favorite_view.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/views/chat/ChatScreen.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class CustomBoxDetail extends StatelessWidget {
  final Function? messagefunction, issavedfunction, sendDemandeFunction;
  final Icon? icon;
  const CustomBoxDetail(
      {Key? key,
      this.messagefunction,
      this.sendDemandeFunction,
      this.icon,
      this.issavedfunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileColntroller profileColntroller = ProfileColntroller();
    ProductsController controller = ProductsController();
    DemandeController dController = DemandeController();
    return Container(
      width: 600,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 1,
          color: AppColor.goldColor.withOpacity(0.1),
        ),
        shape: BoxShape.rectangle,
      ),

      //icons
      child: Expanded(
        flex: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //shopping_cart
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.bookmark_add,
                    color: AppColor.goldColor,
                    size: 30,
                  ),
                  onPressed: () {
                    ////// send demande to vendor // open list event // select event // confirm  (save id event ; id product)
                    /// pending
                    ///vendor confirmation --> yes // no
                    ///
                    ///
                    // dController.createDemande();
                    print(
                        '******************send demande custom box detail******************');
                    sendDemandeFunction!();
                  },
                ),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  text: "Add to Event",
                  textAlign: TextAlign.center,
                )
              ],
            ),
            //message
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.message_rounded,
                    color: AppColor.goldColor,
                    size: 30,
                  ),
                  onPressed: () {

                    
                    messagefunction!();

                    
                  },
                ),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  text: "Massage Vendor",
                  textAlign: TextAlign.center,
                )
              ],
            ),
            //favorite
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    print(
                        '******************favorite custom box detail******************');
                    issavedfunction!();
                    Get.to(FavoriteView());
                  },
                  icon: icon!,
                ),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  text: "Favorite",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
