import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_box_home_detail_product.dart';
import 'package:front/widgets/custom_box_detail.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductDetail extends GetView<ProductsController> {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.getProductById();

    return FutureBuilder(
      future: controller.getProductById(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: AppColor.secondary,
          ); // or a loading indicator
        } else if (snapshot.hasError) {
          return Text('Something went wrong!');
        } else {
          final List<dynamic> imagesList =
              controller.productGetByIdJson?.data?.images ?? [];
          print("testing list${controller.productGetByIdJson!.data!.images}");
          print("testing data${controller.productGetByIdJson!.data!}");
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white, //your color
              surfaceTintColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  controller.getProducts();

                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.goldColor,
                  size: 40,
                ),
              ),
              title: const Column(
                /*     mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              */
                children: [
                  CustomText(
                    textAlign: TextAlign.right,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    text: 'Product detail',
                  ),
                ],
              ),
            ),
            body: CustomBackgroungImage(
              fit: BoxFit.cover,
              image: 'assets/images/landpage.jpg',
              widget: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //scroll images
                            CarouselSlider(
                              items: buildImageSliders(imagesList),
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                              ),
                            ),

                            // text ProductName && price
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: GetBuilder<ProductsController>(
                                  //key: index,

                                  builder: (controller) {
                                    return Column(
                                      children: [
                                        CustomText(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w400,
                                          text:
                                              " ${controller.productGetByIdJson!.data!.nameproduct}",
                                          textAlign: TextAlign.center,
                                        ),
                                        CustomText(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w400,
                                          text:
                                              " ${controller.productGetByIdJson!.data!.price} DT",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),

                            //custom box detail for message, send demande and favorite
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GetBuilder<ProductsController>(
                                  builder: (PController) {
                                return CustomBoxDetail(
                                  issavedfunction: () {
                                    AccountInfoStorage.saveProductId(PController
                                        .productGetByIdJson!.data!.sId
                                        .toString());
                                    print(
                                        "object==================={PController.favoriteByUserIdJson!.data!.length}");
                                    if (PController
                                            .favoriteByUserIdJson!.data !=
                                        null) {
                                      print(
                                          "test6666666666${PController.prodExiste(PController.favoriteByUserIdJson!.data!, PController.productGetByIdJson!.data!.sId)}");
                                      if (PController.prodExiste(
                                          PController
                                              .favoriteByUserIdJson!.data!,
                                          PController
                                              .productGetByIdJson!.data!.sId)) {
                                        print('if-----------------------');

                                        AccountInfoStorage.saveFavoriteId(
                                            PController.productGetByIdJson!
                                                .data!.favorites!.sId);
                                        print(
                                            "${AccountInfoStorage.readFavoriteId()}");

                                        print(
                                            'state from product=========${PController.productGetByIdJson!.data!.favorites!.state!}');
                                        PController.updateFavorite(!PController
                                            .productGetByIdJson!
                                            .data!
                                            .favorites!
                                            .state!);
                                      } else {
                                        print("else ");
                                        PController.createFavorite();
                                      }
                                    } else {
                                      print("else ");
                                      PController.createFavorite();
                                    }
                                  },
                                  icon:
                                      // Icon(Icons.favorite)
                                      PController.productGetByIdJson!.data!
                                                  .favorites ==
                                              null
                                          ? Icon(
                                              Icons.favorite_border,
                                              color: AppColor.goldColor,
                                            )
                                          : Icon(
                                              PController.productGetByIdJson!
                                                      .data!.favorites!.state!
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: PController
                                                      .productGetByIdJson!
                                                      .data!
                                                      .favorites!
                                                      .state!
                                                  ? Colors.red
                                                  : AppColor.goldColor,
                                              size: 30,
                                            ),
                                );
                              }),
                            ),

                            //text for details
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GetBuilder<ProductsController>(
                                  builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      text: "Categorie: ",
                                    ),
                                    Text(
                                      "${controller.productGetByIdJson!.data!.category!.name}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                    CustomText(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      text: "Description",
                                    ),
                                    Text(
                                      "${controller.productGetByIdJson!.data!.description}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  List<Widget> buildImageSliders(List<dynamic> imagesList) {
    return imagesList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.toString(),
                          fit: BoxFit.cover, width: 1000.0),
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
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            '${imagesList.indexOf(item)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
  }
}
