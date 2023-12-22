import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/login_view.dart';
import 'package:front/views/profile_view.dart';
import 'package:front/views/vendors/demande_list.dart';
import 'package:front/views/vendors/service_details.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_sales_box.dart';
import 'package:front/widgets/custom_sales_services.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class HomeViewVendor extends GetView<ProfileColntroller> {
  const HomeViewVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    DemandeController Dcontroller = DemandeController();
    Dcontroller.getDemandeByUserIdAndStateUrl();
    Dcontroller.getDemande();
    Dcontroller.getDemandeByVendorIdAndStateUrl();
    Dcontroller.getDemandeByVendorId();
    controller.getUserById();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white, //your color
        surfaceTintColor: AppColor.white,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(
                  fontSize: 18,
                  text: 'Hello ${AccountInfoStorage.readName().toString()}'),
            ),
          ],
        ),
        leading: Icon(Icons.person_2, size: 50, color: AppColor.goldColor),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5, //<-- SEE HERE
        child: Drawer(
          backgroundColor: AppColor.goldColor.withOpacity(0.9),
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
              ListTile(
                leading: Icon(
                  Icons.event_note_outlined,
                ),
                title: Text('My Products'),
                onTap: () {
                  Get.to(ServiceDetails());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.list_alt_outlined,
                ),
                title: Text('Demande list'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DemandeList()));
                },
              ),
              /* ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingView()));
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
                applicationName: 'My Cool App',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023 Company',
                aboutBoxChildren: [
                  ///Content goes here...
                ],
              ),
              SizedBox(
                height: 50,
              ),*/
              GetBuilder<ProfileColntroller>(
                builder: (c) {
                  return ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                    ),
                    title: Text('Log out'),
                    onTap: () {
                      print('********************logout*************');
                      AccountInfoStorage.deleteImage();
                      controller.phonenumberController.clear();
                      controller.adresseController.clear();
                      c.logOut();
                      Get.to(LoginView());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Expanded(
            child: Column(
              children: [
                //Sales%
                Row(
                  children: [
                    Expanded(
                      child: CustomSalesBox(
                          text1: 'Sales', text2: "This mounth", money: "139 "),
                    ),

                    //Earning%
                    Expanded(
                      child: CustomSalesBox(
                          text1: 'Earning',
                          text2: "This mounth",
                          money: "199 "),
                    ),
                  ],
                ),
                SizedBox(width: 5),

                TextButton(
                    onPressed: () {
                      Get.to(DemandeList());
                    },
                    child: Text("viex")),
                SizedBox(width: 5),

                TextButton(
                    onPressed: () {
                      Get.to(ServiceDetails());
                    },
                    child: Text("viex")),

                // barre d'informations Services Commandes
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomText(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            text: 'List demanded Product'),
                      ),
                      //  barre de titre
                      Expanded(
                        child: Row(children: [
                          SizedBox(width: 10),
                          Expanded(
                            // flex: 2,
                            child: CustomText(
                                // fontSize: 18,
                                fontWeight: FontWeight.w400,
                                text: "Products"),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomText(
                                // fontSize: 18,
                                fontWeight: FontWeight.w400,
                                text: "Buyers "),
                          ),
                          // SizedBox(width: 5),
                          Expanded(
                            child: CustomText(
                                // fontSize: 18,
                                fontWeight: FontWeight.w400,
                                text: "Status"),
                          ),
                          SizedBox(width: 50),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 1,
                          color: AppColor.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                //// list demanded Products
                Expanded(
                  flex: 5,
                  child: FutureBuilder(
                      future: Dcontroller.getDemandeByVendorId(),
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
                                'There is no demande for the moment!!',
                                style: TextStyle(color: AppColor.secondary),
                              ),
                            );
                          } else {
                            return GetBuilder<DemandeController>(
                                builder: (controller) {
                              return ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                ///// get the last 8 demande
                                itemCount: controller.demandeByVendorIdJson!.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  return CustumSalesServices(
                                    productname:
                                        '${controller.demandeByVendorIdJson!.data![index].products!.nameproduct}',
                                    customername:
                                        '${controller.demandeByVendorIdJson!.data![index].users!.username}',
                                    //////////////make icons to be changed with demande status
                                    status: "waiting",
                                    color: AppColor.goldColor,
                                    icon: Icons.abc,
                                    function: () {
                                      Get.to(DemandeList());
                                    },
                                  );
                                },
                              );
                            });
                          }
                        }
                      }),
                ),

                //  (controller.userGetByIdJson.data.items == 'Vendor') ? true : false;
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomText(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              text: 'List demanded services'),
                        ),
                        //  barre de titre
                        Expanded(
                          child: Row(children: [
                            SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  text: "Product Name"),
                            ),
                            // SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  text: "Customer Name"),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  text: "Status"),
                            ),
                            SizedBox(width: 60),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 1,
                            color: AppColor.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //// list Services
                  Expanded(
                    flex: 5,
                    child: FutureBuilder(
                        future: Dcontroller.getDemandeByUserIdAndStateUrl(),
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
                              return GetBuilder<DemandeController>(
                                  builder: (controller) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    // controller: scrollController,
                                    scrollDirection: Axis.vertical,
                                    ///// get the last 8 demande
                                    itemCount: controller
                                        .demandeByUserIdAndStateJson!
                                        .data!
                                        .length,
                                    itemBuilder: (BuildContext context, index) {
                                      return CustumSalesServices(
                                        productname: 'Product Name',
                                        customername: "Customer name",
                                        status: "waiting",
                                        text: "check",
                                        function: () {
                                          Get.to(PendingDemande());
                                        },
                                      );
                                    });
                              });
                            }
                          }
                        }),
                  ),
                */ 