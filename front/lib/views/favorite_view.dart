import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_favorite_list.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

// how to update this ui data
class FavoriteView extends GetView<ProductsController> {
  FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.getAllProductByUserId();
    // controller.getAllfavoriteByUserIdAndState();
    // print("favstate${AccountInfoStorage.readFavoriteState()}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.to(HomeView());
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          /*     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          */
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'Favorite List',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: controller.getAllfavoriteByUserIdAndState(),
                  builder: (context, snapshot) {
                    // print("testing ${controller.favoriteByUserIdAndStateJson!.data!.length}");

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("-----------------snapshot$snapshot");
                      return Center(
                        child: CircularProgressIndicator(
                            color: AppColor.secondary),
                      );
                    } else {
                      // If we got an error
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Something went wrong !!!',
                            style: TextStyle(fontSize: 18),
                          ),
                        );

                        // if we got our data
                      }

                      if (snapshot.data == null) {
                        // Extracting data from snapshot object
                        print(
                            '-----------------------snapshotdata=======>$snapshot');
                        return Center(
                          child: Text(
                            'There is no service for the moment',
                            style: TextStyle(color: AppColor.secondary),
                          ),
                        );
                      } else {
                        return Center(
                          child: Expanded(
                            flex: 6,
                            child: GetBuilder<ProductsController>(
                              builder: (controller) {
                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 2 / 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 20),
                                  itemCount: controller
                                      .favoriteByUserIdAndStateJson!
                                      .data!
                                      .length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return GestureDetector(
                                      child: CustomFavoriteList(
                                        FavoriteFunction: () {
                                          controller
                                              .getAllfavoriteByUserIdAndState();
                                        },
                                        fun: () {
                                          controller
                                              .getAllfavoriteByUserIdAndState();
                                        },
                                        img: 
                                          controller
                                              .favoriteByUserIdAndStateJson!
                                              .data![index]
                                              .products!
                                              .images
                                        ,
                                        icon: Icons.favorite_sharp,
                                        productname:
                                            "${controller.favoriteByUserIdAndStateJson!.data![index].products!.nameproduct}",
                                        Descriptiontext:
                                            "${controller.favoriteByUserIdAndStateJson!.data![index].products!.description}",
                                        ServiceName:
                                            "${controller.favoriteByUserIdAndStateJson!.data![index].products!.category!.name}",
                                        height: 200,
                                        width: 200,
                                        colorBorder: AppColor.goldColor,
                                        widthBorder: 1,
                                      ),
                                      onTap: () {
                                        AccountInfoStorage.saveProductId(
                                          controller
                                              .favoriteByUserIdAndStateJson!.data![index].products!.sId);
                                    
                                        Get.to(ProductDetail());
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
