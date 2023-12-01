import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/demande_controller.dart';
import 'package:front/views/vendors/pending_demande.dart';
import 'package:front/widgets/custom_sales_services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class DemandeList extends  GetView<DemandeController>{
  const DemandeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: FutureBuilder(
          future: controller.getDemandeByUserIdAndStateUrl(),
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

              if (snapshot.data == null) {
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
                      // controller: scrollController,
                      scrollDirection: Axis.vertical,
                      ///// get the last 8 demande
                      itemCount:
                          controller.demandeByUserIdAndStateJson!.data!.length,
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
    );
  }
}
