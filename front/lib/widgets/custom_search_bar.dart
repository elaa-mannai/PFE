import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/models/json/favorite_by_user_id_and_state_json.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/widgets/custom_favorite_list.dart';
import 'package:get/get.dart';

class CustomSearchBar extends GetView<ProductsController> {
  final Function? function;
  final Function(String)? onChanged;
  final Future<Object?>? functionFuture;
  final String? image, label;
  final List<String>? name;
  final List<String>? desc;
  final List<String>? category;
  final int? length;
  const CustomSearchBar({this.label,this.onChanged, this.functionFuture, this.length,
      this.image, this.name, this.desc, this.category,
    Key? key, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GetBuilder<ProductsController>(builder: (context) {
              return TextField(
                cursorColor: AppColor.secondary,
                onChanged: (query) {
                  onChanged!(query);
                  //  controller.filterList(query);
                },
                decoration: InputDecoration(
                  // enabledBorder: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.secondary)),
                  labelStyle: TextStyle(color: AppColor.goldColor),
                  labelText: '$label',
                  hintText: 'Enter a search term',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.secondary,
                  ),
                ),
              );
            }),
          ),
          Expanded(
            flex: 8,
            child: FutureBuilder(
                future: functionFuture!, //controller.getProducts(),
                builder: (ctx, snapshot) {
                  // Checking if future is resolved or not
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("-----------------snapshot$snapshot");
                    return Center(
                      child:
                          CircularProgressIndicator(color: AppColor.secondary),
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
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount:
                                    length, //controller.filteredItemsName.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  // controller.getCategorieById(
                                  //     "${controller.filteredItemsCat[index]}");

                                  return GestureDetector(
                                    child: CustomFavoriteList(
                                      function: () {},
                                      img: image, //'assets/images/logo2.png',
                                      productname: name![index],
                                  //     controller.filteredItemsName[index],
                                      Descriptiontext: desc![index],
                                      //  "${controller.filteredItemsDes[index]}",
                                      ServiceName: category![index],
                                      //    "${controller.filteredItemsCat[index]}",
                                      height: 200,
                                      width: 200,
                                      colorBorder: AppColor.goldColor,
                                      widthBorder: 1,
                                    ),
                                    onTap: () {
                                      print(
                                          "*-------------------------------------------*get category by id*****************");

                                      controller.getProductById();
                                      print(
                                          "*************get category by id*****************");
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
    );
  }
}
