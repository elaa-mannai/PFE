import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/views/vendors/demande_list.dart';
import 'package:front/widgets/custom_sales_services.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CustomDemande extends GetView<DemandeController> {
  const CustomDemande({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    controller.getDemandeById();
    controller.getDemandeByVendorId();

    return FutureBuilder(
        future: controller.getDemandeByVendorIdAndStateUrl(),
        builder: (ctx, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("-----------------snapshot$snapshot");
            return Center(
              child: CircularProgressIndicator(color: AppColor.secondary),
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
            if (snapshot.data == null &&
                controller.getDemandeByIdJson!.data!.state == false) {
              // Extracting data from snapshot object
              print('-----------------------snapshotdata=======>$snapshot');
              return Center(
                child: Text(
                  'There is no demande for the moment!!',
                  style: TextStyle(color: AppColor.secondary),
                ),
              );
            } else {
              return GetBuilder<DemandeController>(builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  ///// get the last 8 demande
                  itemCount:
                      controller.demandeByVendorIdAndStateJson!.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    AccountInfoStorage.saveDemandeId(controller
                        .demandeByVendorIdAndStateJson!.data![index].sId
                        .toString());
                    controller.getDemandeById();

                    return CustumSalesServices(
                      productname:
                          '${controller.demandeByVendorIdAndStateJson!.data![index].products!.nameproduct}',
                      customername:
                          '${controller.demandeByVendorIdAndStateJson!.data![index].users!.username}',
                      //////////////make icons to be changed with demande status
                      // status: "waiting",
                      color: AppColor.goldColor,
                      icon: Icons.arrow_forward_ios_rounded,
                      /*  controller.getDemandeByIdJson!.data!.state!
                          ? Icons.done_rounded
                          : Icons.done_all_rounded, */

                      functionIcon: () {
                        /*  print('demande state ');
                        AccountInfoStorage.saveDemandeId(controller
                            .demandeByVendorIdJson!.data![index].sId
                            .toString());
                        controller.getDemandeById();
                        controller.updateDemande(
                            !controller.getDemandeByIdJson!.data!.state!);
                        print(
                            'demande state ${controller.getDemandeByIdJson!.data!.state}');

                        // */
                        Get.to(DemandeList());
                      },
                    );
                  },
                );
              });
            }
          }
        });
  }
}
