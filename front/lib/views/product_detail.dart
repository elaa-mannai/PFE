import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/vendors/service_details.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_box_home_detail_product.dart';
import 'package:front/widgets/custom_box_detail.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductDetail extends GetView<ProductsController> {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProductById();

    if (AccountInfoStorage.readItems() == "Customer") {
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
                                items: buildImageSliders(imagesList, context),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 1,
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
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: GetBuilder<ProductsController>(
                                  builder: (PController) {
                                    EventController Econtroller =
                                        EventController();
                                    return CustomBoxDetail(
                                      sendDemandeFunction: () {
                                        AccountInfoStorage.saveProductId(
                                            "${PController.productGetByIdJson!.data!.sId}");
                                      },
                                      issavedfunction: () {
                                        AccountInfoStorage.saveProductId(
                                            "${PController.productGetByIdJson!.data!.sId}");
                                        if (PController
                                                .favoriteByUserIdJson!.data !=
                                            null) {
                                          if (PController.prodExiste(
                                              PController
                                                  .favoriteByUserIdJson!.data!,
                                              PController.productGetByIdJson!
                                                  .data!.sId)) {
                                            print('if-----------------------');
                                            AccountInfoStorage.saveFavoriteId(
                                                PController.productGetByIdJson!
                                                    .data!.favorites!.sId);
                                            PController.updateFavorite(
                                                !PController.productGetByIdJson!
                                                    .data!.favorites!.state!);
                                          } else {
                                            print("else ");
                                            PController.createFavorite();
                                          }
                                        } else {
                                          print("else ");
                                          PController.createFavorite();
                                        }
                                      },
                                      icon: PController.productGetByIdJson!
                                                  .data!.favorites ==
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
                                  },
                                ),
                              ),

                              //text for details
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GetBuilder<ProductsController>(
                                    builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
    } else if (AccountInfoStorage.readItems() == "Vendor") {
      return FutureBuilder(
        future: controller.getAllProductByUserId(),
        builder: (context, snapshot) {
          // controller.getProductById();
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
                    controller.getAllProductByUserId();
                    AccountInfoStorage.deleteProductId();
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: SizedBox(width: 20)),
                                  PopupMenuButton<String>(
                                    icon: Icon(Icons.more_vert,
                                        color: AppColor.secondary),
                                    color: AppColor.secondary,
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem<String>(
                                        value: 'update',
                                        child: Text('Update'),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Text('Delete'),
                                      ),
                                    ],
                                    onSelected: (value) {
                                      //  AccountInfoStorage.saveProductId(
                                      //     "${controller.productGetByIdJson!.data!.sId}");

                                      /////update
                                      // controller.getAllProductByUserId();
                                      // AccountInfoStorage.readProductId();
                                      if (value == 'update') {
                                        Get.dialog(AlertDialog(
                                          title: Text(
                                              "Update Product informations:",
                                              style: TextStyle(
                                                  color: AppColor.goldColor)),
                                          backgroundColor: Colors.white,
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                //product title
                                                CustomInputText(
                                                  controller: controller
                                                      .productNameController,
                                                  obscureText: false,
                                                  label: "Product Name:",
                                                ),
                                                //description
                                                CustomInputText(
                                                  controller: controller
                                                      .productDescriptionController,
                                                  obscureText: false,
                                                  label: "Description:",
                                                ),
                                                //price
                                                CustomInputText(
                                                  controller: controller
                                                      .productPriceController,
                                                  obscureText: false,
                                                  label: "Price:",
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            GetBuilder<ProductsController>(
                                              builder: (controller) {
                                                return TextButton(
                                                  child: Text(
                                                    'Update',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.secondary,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () {
                                                    print("object update");
                                                    controller.updateProduct();

                                                    Navigator.of(context).pop();
                                                    controller
                                                        .productDescriptionController
                                                        .clear();
                                                    controller
                                                        .productNameController
                                                        .clear();
                                                    controller
                                                        .productPriceController
                                                        .clear();
                                                    controller.imagefiles =
                                                        null;
                                                    Get.to(ServiceDetails());
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                        ));
                                      }
                                      ///////detete
                                      else if (value == 'delete') {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Text(
                                                    "Do you want to delete this Product?",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .goldColor)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Cancel',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepOrangeAccent)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      controller
                                                          .deleteProduct();
                                                      Navigator.of(context)
                                                          .pop();
                                                      Get.to(ServiceDetails());
                                                    },
                                                    child: Text('OK',
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .secondary)),
                                                  ),
                                                ],
                                              );
                                            });
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //scroll images
                                  CarouselSlider(
                                    items:
                                        buildImageSliders(imagesList, context),
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      aspectRatio: 1,
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
                                          // AccountInfoStorage.saveProductId(
                                          //     "${controller.productGetByIdJson!.data!.sId}");

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

                                  //text for details
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GetBuilder<ProductsController>(
                                        builder: (context) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
    } else {
      return Text("admin");
    }
  }

  List<Widget> buildImageSliders(
      List<dynamic> imagesList, BuildContext context) {
    return imagesList
        .map((item) => Container(
              child: Container(
                // margin: const EdgeInsets.all(3.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item.toString(),
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(0, 255, 255, 255)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
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
