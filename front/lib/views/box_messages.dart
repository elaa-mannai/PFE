import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/chat_controller.dart';
import 'package:front/views/test/ChatScreen.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class BoxMessages extends GetView<ChatController> {
  const BoxMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var hasEncounteredError = Provider.of<User>(context).hasEncounteredError;
    // bool hasLoaded = Provider.of<ParticipatedChatRooms>(context).hasLoaded;
    // List chatRooms =
    //     Provider.of<ParticipatedChatRooms>(context).roomParticipation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white, //your color
        surfaceTintColor: AppColor.white,
        elevation: 0,
        shadowColor: AppColor.white,
        // centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
              // textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'Chat Box',
            ),
          ],
        ),
      ),
      body:
          // ? LoginScreen()
          CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(185, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Expanded(
            flex: 1,
            child: FutureBuilder(
              future: controller.getchatuserId(),
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
                    print(
                        '-----------------------snapshotdata=======>$snapshot');
                    return Center(
                      child: Text(
                        'There is no demande for the moment!!',
                        style: TextStyle(color: AppColor.secondary),
                      ),
                    );
                  } else {
                    return GetBuilder<ChatController>(builder: (controller) {
                      return ListView.builder(
                        itemCount: controller.getChatByUserId!.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: ListTileTheme(
                              minVerticalPadding: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                  tileColor: AppColor.white,
                                  onTap: () {
                                    AccountInfoStorage.saveRecieverId(controller
                                        .getChatByUserId!
                                        .data![index]
                                        .reciever!
                                        .username
                                        .toString());
                                    AccountInfoStorage.saveChatId(controller
                                        .getChatByUserId!.data![index].sId);
                                    Get.to(ChatScreen());
                                  },
                                  subtitle: Text(
                                    "${controller.getChatByUserId!.data![index].messages!.last}",
                                    style: TextStyle(color: AppColor.secondary),
                                  ),
                                  title: Text(
                                    "${controller.getChatByUserId!.data![index].reciever!.username}",
                                    style: TextStyle(color: AppColor.goldColor),
                                  ),
                                  leading: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.secondary,
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: CircleAvatar(
                                      //get uesr photo from backend
                                      backgroundImage: NetworkImage(
                                          "${AccountInfoStorage.readImage()}" ==
                                                  null
                                              ? "https://media.istockphoto.com/id/1300845620/fr/vectoriel/appartement-dic%C3%B4ne-dutilisateur-isol%C3%A9-sur-le-fond-blanc-symbole-utilisateur.jpg?s=612x612&w=0&k=20&c=BVOfS7mmvy2lnfBPghkN__k8OMsg7Nlykpgjn0YOHj0="
                                              : "${AccountInfoStorage.readImage()}"),
                                      maxRadius: 25,
                                    ),
                                  )),
                            ),
                          );
                        },
                      );
                    });
                  }
                }
              },
            ),
          ),
          // : Center(
          //     child: CircularProgressIndicator(),
          //   ),
        ),
      ),
    );
  }
}
