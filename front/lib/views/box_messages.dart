import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';

class BoxMessages extends StatelessWidget {
  const BoxMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var hasEncounteredError = Provider.of<User>(context).hasEncounteredError;
    // bool hasLoaded = Provider.of<ParticipatedChatRooms>(context).hasLoaded;
    // List chatRooms =
    //     Provider.of<ParticipatedChatRooms>(context).roomParticipation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        centerTitle: true,
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
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'Chat Box',
            ),
          ],
        ),
      ),
      body:
          // ? LoginScreen()
          Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ListTileTheme(
                      minVerticalPadding: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                          tileColor: Colors.white,
                          onTap: () {
                            // Provider.of<ChatRoom>(context, listen: false)
                            //     .loadChatRoomById(
                            //         chatRooms[index]['chatRoom']['id']);
                            // Navigator.of(context).pushNamed(
                            //     Routes.CHAT_ROOM.path,
                            //     arguments: chatRooms[index]['chatRoom']
                            //         ['id']);
                          },
                          title: Text(
                            "vendor name",
                            // chatRooms[index]['chatRoom']['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          leading:
                              //  chatRooms[index]['chatRoom']
                              //             ['imageUrl'] ==
                              //         ''
                              //     ?
                              Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Icon(Icons.group_sharp),
                          )
                          // : ClipRRect(
                          //     borderRadius: BorderRadius.circular(40),
                          //     child: CachedNetworkImage(
                          //       height: 55,
                          //       width: 55,
                          //       fit: BoxFit.cover,
                          //       imageUrl: chatRooms[index]['chatRoom']
                          //           ['imageUrl'],
                          //     ),
                          //   ),
                          ),
                    ),
                  );
                },
              )
              // : Center(
              //     child: CircularProgressIndicator(),
              //   ),
              ),
    );
  }
}
