import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_favorite_list.dart';
import 'package:front/widgets/custom_search_bar.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductSelectionByServices extends GetView<ProductsController> {
  ProductSelectionByServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScrollController scrollController = ScrollController();

    //controller.getCategorieById(controller.categorieGetByIdJson!.data!.sId.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              AccountInfoStorage.deleteCategorieId();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.goldColor,
              size: 40,
            )),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'Services',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          children: [
            //search bar
            GetBuilder<ProductsController>(builder: (controller) {
              return Expanded(
                  flex: 1,
                  child: CustomSearchBar(
                    onChanged: (query) {
                      controller.filterList1(query);
                    },
                    label: 'Search',
                    functionFuture: controller.getProductByCatgoryId(),
                    image: controller.filteredItemsImagesC,
                    length: controller.filteredItemsNameC.length,
                    name: controller.filteredItemsNameC,
                    category: controller.filteredItemsCatC,
                    desc: controller.filteredItemsDesC,
                    ontap: () {
                      /////////////////////// fix this one

                      Get.to(ProductDetail());
                      print("*************get category by id*****************");
                    },
                  ));
            })
          ],
        ),
      ),
    );
  }
}
