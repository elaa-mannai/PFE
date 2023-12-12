import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/categorie_contoller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/state_manager.dart';

class HomeViewAdmin extends GetView<CategorieController> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    controller.getCategories();

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
    drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
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
                  }),
           
           
            Expanded(
              child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // Category category = categoryProvider.categories[index];
                        // Assuming you have separate lists for users and vendors
                        int userCount = 5 /* Get user count for the category */;
                        int vendorCount =  5 /* Get vendor count for the category */;
            
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                 ' category.name',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text('Users: $userCount'),
                                SizedBox(height: 4),
                                Text('Vendors: $vendorCount'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
                
            ],
          ),
        ),
      ),
    );
  }
}
