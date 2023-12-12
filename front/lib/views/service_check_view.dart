import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_service_list.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ServiceCheckView extends GetView<DemandeController> {
  const ServiceCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.goldColor,
              size: 40,
            )),
        title: CustomText(
          fontSize: 16,
          text: 'Pack of services',
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Expanded(
            child: FutureBuilder(
              future: controller.getDemandeByUserIdAndStateUrl(),
              builder: (ctx, snapshot) {
                print('snapshot==============================>$snapshot');
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("-----------------snapshot$snapshot");
                  return Center(
                    child: CircularProgressIndicator(color: AppColor.secondary),
                  );
                } else {
                  print('snapshot==============================>$snapshot');
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
                        'No Demande for the moment!',
                        style: TextStyle(color: AppColor.secondary),
                      ),
                    );
                  } else {
                    return Center(
                      child: Expanded(child:
                          GetBuilder<DemandeController>(builder: (controller) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20),
                            itemCount: controller
                                .demandeByUserIdAndStateJson!.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              ///// put this part with the state of true or false to make the icon change like the favorite function with update 
                              return CustomServiceList(
                                fun: () {
                                  controller.getDemandeByUserIdAndStateUrl();
                                },
                                // img: [],//(controller.demandeByUserIdAndStateJson!.data![index].products!.images),
                                Vname:'${controller.demandeByUserIdAndStateJson!.data![index].products!.user!.username}',
                                Vnumber:
                                   '${controller.demandeByUserIdAndStateJson!.data![index].products!.user!.phone}',
                                price:
                                    '${controller.demandeByUserIdAndStateJson!.data![index].products!.price}',
                                product:
                                    '${controller.demandeByUserIdAndStateJson!.data![index].products!.nameproduct}',
                              );
                            });
                      })),
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
