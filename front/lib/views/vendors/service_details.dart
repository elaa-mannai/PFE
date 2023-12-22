import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/views/vendors/home_view_vendor.dart';
import 'package:front/widgets/components/image_grid.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_product_list_V.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ServiceDetails extends GetView<ProductsController> {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    controller.getCategories();
    controller.getProductById();
    controller.getAllProductByUserId();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.white, //your colorr
        surfaceTintColor: AppColor.white,
        leading: IconButton(
          onPressed: () {
            Get.to(HomeViewVendor());
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(fontSize: 18, text: 'My produsct list'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                text: "Hello, ${AccountInfoStorage.readName().toString()}!",
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),

              /// Events
              /*           Expanded(
                flex: 1,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.productsByUserIdJson!.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return CustomProductListV(
                        colorBorder: AppColor.secondary,
                        productName:
                            "${controller.productsByUserIdJson!.data![index].nameproduct}",
                        description:
                            "${controller.productsByUserIdJson!.data![index].description}",
                        local: "testesttestt",
                        price: "${controller.productsByUserIdJson!.data![index].price}",
                        widthBorder: 2,
                        function: () {},
                      );
                    }),
              ),
 */
              Expanded(
                child: FutureBuilder(
                    future: controller.getAllProductByUserId(),
                    builder: (ctx, snapshot) {
                      // Checking if future is resolved or not
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
                              '${snapshot.error} occurred',
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
                              'There is no product for the moment. \n addProduct and make the best sells !!',
                              style: TextStyle(color: AppColor.secondary),
                            ),
                          );
                        } else {
                          return Expanded(
                            flex: 5,
                            child: GetBuilder<ProductsController>(
                              builder: (controller) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  controller: scrollController,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller
                                      .productsByUserIdJson!.data!.length,
                                  itemBuilder: (BuildContext context, index) {
                                    controller.getCategorieById(
                                        "${controller.productGetJson!.data![index].category!.name}");

                                    return GestureDetector(
                                      child: CustomProductListV(
                                        colorBorder: AppColor.secondary,
                                        img: controller.productsByUserIdJson!
                                            .data![index].images,
                                        productName:
                                            "${controller.productsByUserIdJson!.data![index].nameproduct}",
                                        description:
                                            "${controller.productsByUserIdJson!.data![index].description}",
                                        local: "location map",
                                        price:
                                            "${controller.productsByUserIdJson!.data![index].price}",
                                        categorie:
                                            "${controller.productGetJson!.data![index].category!.name}",
                                        widthBorder: 2,
                                        function: () {},
                                      ),
                                      onTap: () {
                                        // AccountInfoStorage.saveProductId(
                                        //     "${controller.productGetByIdJson!.data!.sId}");
                                        AccountInfoStorage.saveProductId(
                                            "${controller.productsByUserIdJson!.data![index].sId}");
                                        Get.to(ProductDetail());
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      }
                    }),
              ),

              Expanded(child: SizedBox(width: 50)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.secondary,
          foregroundColor: AppColor.white,
          shape: BeveledRectangleBorder(),
          label: Text('New Service'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomMultiImageChange()));
          }),
    );
  }
}
