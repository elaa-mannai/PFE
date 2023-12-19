import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/product_selection_by_services.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custum_image_resize.dart';
import 'package:get/get.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white, //your color
        surfaceTintColor:AppColor.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
              text: 'All Categories',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Expanded(
            flex: 1,
            child: Column(
              children: [
                //services list
                Expanded(
                  flex: 6,
                  child: ListView.separated(
                    //padding: const EdgeInsets.all(2),
                    itemCount: controller.categorieJson!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const CustumImageResize(
                            image: "assets/images/landpage.jpg",
                          ),
                          CustomButton(
                            height: 50,
                            width: 300,
                            text:
                                "${controller.categorieJson!.data![index].name}",
                            function: () {
                              Get.to(ProductSelectionByServices());
                            },
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
