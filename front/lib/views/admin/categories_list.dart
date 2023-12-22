import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/categorie_contoller.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/admin/home_view_admin.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CategoriesListView extends GetView<CategorieController> {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCategories();
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white, //your color
        surfaceTintColor: AppColor.white,
        leading: IconButton(
          onPressed: () {
            Get.to(HomeViewAdmin());

            // Navigator.pop(context);
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppColor.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                // Handle settings
              },
            ),
          ],
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
              CustomInputText(
                obscureText: false,
                label: 'Category Name',
                controller: controller.categoryNameController,
              ),
              SizedBox(height: 16),
              CustomButton(
                function: () {
                  if (controller.categoryNameController.text.isNotEmpty) {
                    controller.createCategorie();
                    controller.categoryNameController.clear();
                    // controller.getCategories();
                    Get.to(HomeViewAdmin());
                  }
                },
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                backgroundColor: AppColor.goldColor,
                text: 'Add Category',
              ),
              SizedBox(height: 16),
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
                              scrollDirection: Axis.vertical,
                              itemCount: controller.categorieJson!.data!.length,
                              itemBuilder: (BuildContext context, index) {
                                return CustomText(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                  text:
                                      '${controller.categorieJson!.data![index].name}',
                                  // colorBorder: AppColor.goldColor,
                                  // widthBorder: 1,
                                );
                              }),
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
