import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_sales_services.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class DemandeList extends GetView<DemandeController> {
  const DemandeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    controller.getDemande();
    controller.getDemandeByVendorId();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.goldColor,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
              //code to execute when this button is pressed
            }),
        backgroundColor: AppColor.white , //your color
        surfaceTintColor: AppColor.white ,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                text: 'Demande List',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            /*    mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
           */
            children: [
              Expanded(
                flex: 5,
                child: FutureBuilder(
                    future: controller.getDemandeByVendorId(),
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
                                itemCount: 8,
                                itemBuilder: (BuildContext context, index) {
                                  return  CustumSalesServices(
                                          color: AppColor.goldColor,
                                          productname:
                                            'test',//  '${controller.demandeByVendorIdJson!.data![index].products?.nameproduct}',
                                          customername:
                                           'test',//  "${controller.demandeByVendorIdJson!.data![index].users}",
                                          status: "waiting",
                                          function: () {
                                           /*  AccountInfoStorage.saveDemandeId(
                                                "${controller.getDemandeByIdJson!.data!.sId}");
                                            if (controller
                                                    .demandeByVendorIdJson!
                                                    .data !=
                                                null) {
                                              if (controller.demandeExiste(
                                                  controller
                                                      .getAllDemandeJson!.data!,
                                                  controller.getDemandeByIdJson!
                                                      .data!.sId)) {
                                                print(
                                                    'if-----------------------');
                                                AccountInfoStorage
                                                    .saveDemandeId(controller
                                                        .getDemandeByIdJson!
                                                        .data!
                                                        .sId);
                                                controller.updateDemande(
                                                    !controller
                                                        .getDemandeByIdJson!
                                                        .data!
                                                        .state!);
                                              } else {
                                                print("else ");
                                                controller.createDemande();
                                              }
                                            } else {
                                              print("else ");
                                              controller.createDemande();
                                            } */
                                          },
                                      );
                                });
                          });
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
