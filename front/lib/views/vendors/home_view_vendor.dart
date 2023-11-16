import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/login_view.dart';
import 'package:front/views/profile_view.dart';
import 'package:front/views/vendors/pending_demande.dart';
import 'package:front/views/vendors/profile_view_vendor.dart';
import 'package:front/views/vendors/service_details.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_sales_box.dart';
import 'package:front/widgets/custom_sales_services.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class HomeViewVendor extends StatelessWidget {
  const HomeViewVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,

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
                  backgroundImage: NetworkImage("${AccountInfoStorage.readImage()}" ==''?'assets/images/p.jpg':"${AccountInfoStorage.readImage()}" ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileView()));
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
              /*  ListTile(
                leading: Icon(
                  Icons.favorite,
                ),
                title: Text('Favorite list'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoriteView()));
                },
              ),
              ListTile(
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
      body: CustomBackgroungImage(
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
                    Get.to(ServiceDetails());
                  },
                  child: Text("viex")),

              // Services Commandes
              Expanded(
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
                              text: "Quantity"),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomText(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              text: "Price"),
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
                child: ListView.builder(
                    shrinkWrap: true,
                    // controller: scrollController,
                    scrollDirection: Axis.vertical,
                    ///// get the last 8 demande
                    itemCount: 18,
                    itemBuilder: (BuildContext context, index) {
                      return CustumSalesServices(
                        text1: 'Product Name',
                        productnumber: "20",
                        price: "200",
                        text: "check",
                        function: () {
                          Get.to(PendingDemande());
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
