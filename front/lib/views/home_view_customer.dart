import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/event_list_view.dart';
import 'package:front/views/favorite_view.dart';
import 'package:front/views/product-by-categorie.dart';
import 'package:front/views/product_detail.dart';
import 'package:front/views/product_selection_by_services.dart';
import 'package:front/views/profile_view.dart';
import 'package:front/views/setting_view.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_box_home_detail_product.dart';
import 'package:front/widgets/custom_button_text.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_favorite_list.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class HomeView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    ProfileColntroller PController = ProfileColntroller();
    controller.getProductById();
    /* controller.getCategories();
    controller.getProducts();
    Future<String> getData() {
      return Future.delayed(Duration(seconds: 2), () {
        return "I am data";
        // throw Exception("Custom Error");
      });
    } */

    // controller.getNameCategory();
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.person_2,
            size: 50,
            color: AppColor.goldColor,
          ),
          backgroundColor: Colors.white, //your color
          surfaceTintColor: Colors.white,

          title: Expanded(
            flex: 0,
            child: CustomText(
              fontSize: 18,
              text: 'Hello ${AccountInfoStorage.readName().toString()}',
            ),
          ),
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.5, //<-- SEE HERE
          child: Drawer(
            backgroundColor: AppColor.goldColor.withOpacity(0.9),
            child: Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,

                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(AccountInfoStorage.readName().toString()),
                    accountEmail:
                        Text(AccountInfoStorage.readEmail().toString()),
                    currentAccountPicture: CircleAvatar(
                      //get uesr photo from backend
                      backgroundImage: NetworkImage(
                          AccountInfoStorage.readImage().toString()),
                      maxRadius: 25,
                    ),
                    decoration: BoxDecoration(color: AppColor.goldColor),
                  ),
                  //profile
                  ListTile(
                    leading: Icon(
                      Icons.person_2_outlined,
                    ),
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView()));
                    },
                  ),
                  //event
                  ListTile(
                    leading: Icon(
                      Icons.event_note_outlined,
                    ),
                    title: Text('My events'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventListView()));
                    },
                  ),

                  ///fav list
                  GetBuilder<ProductsController>(builder: (controller) {
                    return ListTile(
                      leading: Icon(
                        Icons.favorite,
                      ),
                      title: Text('Favorite list'),
                      onTap: () {
                        // print("listDrawer${controller.savedFavProd}");
                        print("listDrawer");

                        /*   controller.getAllFavoriteByUserId();
                         AccountInfoStorage.saveFavoriteId(
                            '${controller.favoriteByUserIdJson!.data!}');
                        print(
                            "objectstate  ${AccountInfoStorage.readFavoriteId()}");
 */
                        Get.to(FavoriteView());
                      },
                    );
                  }),
                  //setting
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                    ),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingView()));
                    },
                  ),
                  AboutListTile(
                    // <-- SEE HERE
                    icon: Icon(
                      Icons.info,
                    ),
                    child: Text('About app'),
                    applicationIcon: Icon(
                      Icons.local_play,
                    ),
                    applicationName: 'My Event Mangement App',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2023 Company',
                    aboutBoxChildren: [],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //logout
                  GetBuilder<ProfileColntroller>(builder: (c) {
                    return ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                      ),
                      title: Text('Log out'),
                      onTap: () {
                        print('********************logout*************');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Do you want to logout?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    c.logOut();
                                  },
                                  child: Text('OK'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomBackgroungImage(
            fit: BoxFit.cover,
            image: 'assets/images/landpage.jpg',
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //service
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          textAlign: TextAlign.justify,
                          text: 'Services',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          //textAlign: TextAlign.left,
                        ),
                      ),
                      //view all
                      Expanded(
                        flex: 1,
                        child: CustomButtonText(
                          text: 'View All',
                          icon: Icons.arrow_forward,
                          function: () {
                            Get.to(ProductSelectionByServices());
                            // Get.to(EventListView());
                            //  Get.to(ProductDetail());
                            // Get.to(FavoriteView());
                            //  Get.to(ProfileView());
                          },
                        ),
                      )
                    ],
                  ),
                ),

                //list service names
                FutureBuilder(
                    future: controller.getCategories(),
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
                              'There is no availble services for the moment',
                              style: TextStyle(color: AppColor.secondary),
                            ),
                          );
                        } else {
                          print(
                              'categories length============> ${controller.categorieJson!.data!.length}');
                          print('categories============> ${snapshot.data}');
                          return Expanded(
                            flex: 1,
                            child: ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.categorieJson!.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  return CustomChechbox(
                                    function: () {
                                      AccountInfoStorage.saveCatgorieId(
                                          controller
                                              .categorieJson!.data![index].sId);
                                      AccountInfoStorage.saveCatgorieName(
                                          controller.categorieJson!.data![index]
                                              .name);

                                      //  controller.getProductByCatgoryId();

                                      Get.to(ProductByCategorie());
                                    },
                                    text:
                                        '${controller.categorieJson!.data![index].name}',
                                    colorBorder: AppColor.goldColor,
                                    widthBorder: 1,
                                  );
                                }),
                          );
                        }
                      }
                    }),

                //list products
                Expanded(
                  flex: 5,
                  child: FutureBuilder(
                      future: controller.getProducts(),
                      builder: (ctx, snapshot) {
                        // Checking if future is resolved or not
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                flex: 5,
                                child: GetBuilder<ProductsController>(
                                  builder: (controller) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .productGetJson!.data!.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        controller.getCategorieById(
                                            "${controller.productGetJson!.data![index].category!.name}");
                                        return GestureDetector(
                                          child: CustomBoxHomeDetailsProduct(
                                            function: () {},
                                            fun: () {
                                              controller.getProductById();
                                            },
                                            img: (controller.productGetJson!
                                                .data![index].images),
                                            ServiceName:
                                                "${controller.productGetJson!.data![index].category!.name}",
                                            productname:
                                                "${controller.productGetJson!.data![index].nameproduct}",
                                            Descriptiontext:
                                                "${controller.productGetJson!.data![index].description}",
                                            height: 200,
                                            width: 200,
                                            colorBorder: AppColor.goldColor,
                                            widthBorder: 1,
                                          ),
                                          onTap: () {
                                            ////
                                            print(
                                                "*-------------------------------------------*get category by id*****************");
                                            AccountInfoStorage.saveProductId(
                                                controller.productGetJson!
                                                    .data![index].sId);
                                            controller.getProductById();
                                            Get.to(ProductDetail());
                                            print(
                                                "*************get category by id*****************");
                                          },
                                        );
                                        /* GestureDetector(
                                          child: CustomBoxHomeDetailsProduct(
                                            function: () {},
                                            img: ["${controller.productGetByIdJson!.data!.images![index]}"],
                                            /* '${controller.productGetJson!.data![index].images}', */
                                            ServiceName:
                                                "${controller.productGetJson!.data![index].category!.name}",
                                            productname:
                                                "${controller.productGetJson!.data![index].nameproduct}",
                                            Descriptiontext:
                                                "${controller.productGetJson!.data![index].description}",
                                            height: 200,
                                            width: 200,
                                            colorBorder: AppColor.goldColor,
                                            widthBorder: 1,
                                          ),
                                          onTap: () {
                                            ////
                                            print(
                                                "*-------------------------------------------*get category by id*****************");
                                            AccountInfoStorage.saveProductId(
                                                controller.productGetJson!
                                                    .data![index].sId);
                                            controller.getProductById();
                                            Get.to(ProductDetail());
                                            print(
                                                "*************get category by id*****************");
                                          },
                                        ); */
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

                // Top vendors
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          textAlign: TextAlign.justify,
                          text: 'Top Vendors',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          //textAlign: TextAlign.left,
                        ),
                      ),
                      //view all
                      Expanded(
                        flex: 1,
                        child: CustomButtonText(
                          text: 'View All',
                          icon: Icons.arrow_forward,
                          function: () {
                            //  Get.to();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                ////vendor profile data
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return CustomFavoriteList(
                          function: () {},
                          icon: Icons.reviews,
                          img:
                              "${controller.productGetJson!.data![index].images}",
                          ServiceName: "Catering",
                          Descriptiontext: '',
                          //  'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qul est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum',
                          height: 200,
                          width: 200,
                          colorBorder: Colors.white.withOpacity(1),
                          widthBorder: 1,
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
