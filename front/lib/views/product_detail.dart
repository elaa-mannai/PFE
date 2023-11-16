import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_box_description_detail.dart';
import 'package:front/widgets/custom_box_detail.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductDetail extends GetView<ProductsController> {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.getProductById();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
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
                        items: imageSliders,
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
                              controller.getProductById();

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
                              if (PController.favoriteByUserIdJson!.data !=
                                  null) {
                                print(
                                    "test6666666666${PController.prodExiste(PController.favoriteByUserIdJson!.data!, PController.productGetByIdJson!.data!.sId)}");
                                if (PController.prodExiste(
                                    PController.favoriteByUserIdJson!.data!,
                                    PController
                                        .productGetByIdJson!.data!.sId)) {
                                  print('if-----------------------');

                                  AccountInfoStorage.saveFavoriteId(PController
                                      .productGetByIdJson!
                                      .data!
                                      .favorites!
                                      .sId);
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
                                        PController.productGetByIdJson!.data!
                                                .favorites!.state!
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: PController.productGetByIdJson!
                                                .data!.favorites!.state!
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
                        child: CustomBoxDescriptionDetail(),
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
}

// list of images
final List<String> imgList = [
//"${AccountInfoStorage.readProductImage().toString()}"
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
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
                          'No. ${imgList.indexOf(item)} image',
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
