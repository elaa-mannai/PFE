import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/categorie_contoller.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/admin/categories_list.dart';
import 'package:front/views/profile_view.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class HomeViewAdmin extends StatelessWidget {
  const HomeViewAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DemandeController Dcontroller = DemandeController();
    ProfileColntroller profileColntroller = ProfileColntroller();
    CategorieController categorieController = CategorieController();
    EventController eventController = EventController();

    categorieController.getCategories();
    ScrollController scrollController = ScrollController();
    // controller.getallusers();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person_2,
          size: 50,
          color: AppColor.goldColor,
        ),
        backgroundColor: AppColor.white, //your color
        surfaceTintColor: AppColor.white,

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
                  accountEmail: Text(AccountInfoStorage.readEmail().toString()),
                  currentAccountPicture: CircleAvatar(
                    //get uesr photo from backend
                    backgroundImage: NetworkImage(
                        "${AccountInfoStorage.readImage()}" == null
                            ? "https://media.istockphoto.com/id/1300845620/fr/vectoriel/appartement-dic%C3%B4ne-dutilisateur-isol%C3%A9-sur-le-fond-blanc-symbole-utilisateur.jpg?s=612x612&w=0&k=20&c=BVOfS7mmvy2lnfBPghkN__k8OMsg7Nlykpgjn0YOHj0="
                            : "${AccountInfoStorage.readImage()}"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileView()));
                  },
                ),

                //create categories
                ListTile(
                  leading: Icon(
                    Icons.event_note_outlined,
                  ),
                  title: Text('Categorie list'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesListView()));
                  },
                ),
                //event
                //   ListTile(
                //     leading: Icon(
                //       Icons.event_note_outlined,
                //     ),
                //     title: Text('My events'),
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   EventListView(fromProductDetail: false)));
                //     },
                //   ),

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
                            backgroundColor: Colors.white,
                            title: Text("Do you want to logout?",
                                style: TextStyle(color: AppColor.goldColor)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel',
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent)),
                              ),
                              TextButton(
                                onPressed: () {
                                  c.logOut();
                                  AccountInfoStorage.deleteImage();
                                  AccountInfoStorage.deleteProductId();
                                  AccountInfoStorage.deleteItems();
                                },
                                child: Text('OK',
                                    style:
                                        TextStyle(color: AppColor.secondary)),
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
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // list of categories
                    FutureBuilder(
                        future: categorieController.getCategories(),
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
                                  'There is no availble categories for the moment',
                                  style: TextStyle(color: AppColor.secondary),
                                ),
                              );
                            } else {
                              print(
                                  'categories length============> ${categorieController.categorieJson!.data!.length}');
                              print('categories============> ${snapshot.data}');
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(CategoriesListView());
                                  },
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Card(
                                            surfaceTintColor:
                                                AppColor.secondary,
                                            color: AppColor.goldColor,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Categories List ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${categorieController.categorieJson!.data!.length}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${categorieController.categorieJson!.data![index].name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ));
                                    },
                                  ),
                                ),
                              );
                            }
                          }
                        }),

                    // list of Events Published
                    FutureBuilder(
                        future: eventController.getEvents(),
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
                                  'There is no availble Events for the moment',
                                  style: TextStyle(color: AppColor.secondary),
                                ),
                              );
                            } else {
                              print(
                                  'event============> ${eventController.eventGetJson!.data!.length}');
                              print('event ============> ${snapshot.data}');
                              return Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                  ),
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Card(
                                        surfaceTintColor: AppColor.secondary,
                                        color: AppColor.goldColor,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Event List ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${eventController.eventGetJson!.data!.length}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          
                                       
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }
                        }),
                  ],
                ),
              ),
              /*         Expanded(
                child: FutureBuilder(
                    future: profileColntroller.getallusers(),
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
                              'There is no availble user for the moment',
                              style: TextStyle(color: AppColor.secondary),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Card(
                                    surfaceTintColor: AppColor.secondary,
                                    color: AppColor.goldColor,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Users ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${profileColntroller.userGetByIdJson!.message}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        /* Text(
                                              "${categorieController.categorieJson!.data![index].name}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                         */
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }
                    }),
              ),

       */ /*   Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    // Category category = categoryProvider.categories[index];
                    // Assuming you have separate lists for users and vendors
                    //"${controller.eventByUserIdJson!.data![index].guests!.length}"
                    int userCount = 5;
                    //profileColntroller.usersAllJson!.data!.length;
                    int vendorCount = 5 /* Get vendor count for the category */;

                    return Card(
                      surfaceTintColor: AppColor.secondary,
                      color: AppColor.goldColor,
                      child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Users',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text('Customers: ${userCount.toString()}'),
                            SizedBox(height: 4),
                            Text('Vendors: $vendorCount'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
             */
            ],
          ),
        ),
      ),
    );
  }
}
