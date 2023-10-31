import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/models/json/guest_by_event_id_json.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class GuestList extends GetView<EventController> {
  //final List<ListItem> items;

  const GuestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    ListTileTitleAlignment? titleAlignment;

    //controller.getAllGuestsByEventId();
    // controller.getGuests();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          /*     mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          */
          children: [
            CustomText(
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              text: 'My Guest list',
            ),
          ],
        ),
      ),
      body: CustomBackgroungImage(
        fit: BoxFit.cover,
        image: 'assets/images/landpage.jpg',
        widget: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: controller.getAllEventByUserId(),
                builder: (ctx, snapshot) {
                  print('snapshot==============================>$snapshot');
                  // Checking if future is resolved or not
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("-----------------snapshot$snapshot");
                    return Center(
                      child:
                          CircularProgressIndicator(color: AppColor.secondary),
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
                          'No Guests for the moment! Wanna add you first guest for this event!',
                          style: TextStyle(color: AppColor.secondary),
                        ),
                      );
                    } else {
                      return GetBuilder<EventController>(builder: (controller) {
                        return ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                controller.eventByUserIdJson!.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return Text("data");
                            });
                      });
                    }
                  }
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.getAllGuestsByEventId(),
                builder: (ctx, snapshot) {
                  print('snapshot==============================>$snapshot');
                  // Checking if future is resolved or not
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("-----------------snapshot$snapshot");
                    return Center(
                      child:
                          CircularProgressIndicator(color: AppColor.secondary),
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
                          'No Guests for the moment! Wanna add you first guest for this event!',
                          style: TextStyle(color: AppColor.secondary),
                        ),
                      );
                    } else {
                      return GetBuilder<EventController>(
                        builder: (controller) {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                controller.guestByEventIdJson!.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    titleAlignment: titleAlignment,
                                    leading:
                                        Icon(Icons.person, size: 70, shadows: [
                                      Shadow(
                                          color: AppColor.secondary,
                                          offset: Offset.fromDirection(20, 3))
                                    ]),
                                    title: CustomText(
                                        text:
                                            '${controller.guestByEventIdJson!.data![index].name}',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    subtitle: CustomText(
                                        text:
                                            '${controller.guestByEventIdJson!.data![index].phonenumber}',
                                        fontSize: 16),
                                    trailing:
                                        PopupMenuButton<ListTileTitleAlignment>(
                                      color: AppColor.goldColor,
                                      onSelected:
                                          (ListTileTitleAlignment? value) {
                                        titleAlignment = value;
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<
                                              ListTileTitleAlignment>>[
                                        PopupMenuItem(
                                          onTap: () {
                                            print(
                                                "sId update this element ${controller.guestByEventIdJson!.data![index].sId}");
                                            Get.dialog(AlertDialog(
                                              title: Text(
                                                  "Update guest informations:",
                                                  style: TextStyle(
                                                      color:
                                                          AppColor.goldColor)),
                                              backgroundColor: Colors.white,
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    //guest name
                                                    CustomInputText(
                                                      controller: controller
                                                          .guestNameConroller,
                                                      obscureText: false,
                                                      label: "Name:",
                                                    ),
                                                    //phone number
                                                    CustomInputText(
                                                      controller: controller
                                                          .guestPhonenumberConroller,
                                                      obscureText: false,
                                                      label: "Phone Number:",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                GetBuilder<EventController>(
                                                  builder: (controller) {
                                                    return TextButton(
                                                      child: Text(
                                                        'Update',
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .secondary,
                                                            fontSize: 20),
                                                      ),
                                                      onPressed: () {
                                                        /*                          showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  "Do you want to make changes?"),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () {
                                                                    print("object update");
                                                                    controller
                                                                        .updateGuest(
                                                                            '${controller.guestByEventIdJson!.data![index].sId}');
                                                                    //controller.getAllGuestsByEventId();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text('OK'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                               */
                                                        print("object update");
                                                        controller.updateGuest(
                                                            '${controller.guestByEventIdJson!.data![index].sId}');
                                                        //controller.getAllGuestsByEventId();
                                                        Navigator.of(context)
                                                            .pop();

                                                        controller
                                                            .guestNameConroller
                                                            .clear();
                                                        controller
                                                            .guestPhonenumberConroller
                                                            .clear();
                                                      },
                                                    );
                                                  },
                                                )
                                              ],
                                            ));

                                            print("updates");
                                          },
                                          child: Text('Update'),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            // AccountInfoStorage.saveGuestId(controller
                                            //     .guestByEventIdJson!.data![index].sId);
                                            print(
                                                "sId delete this element ${controller.guestByEventIdJson!.data![index].sId}");
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Do you want to delete this guest?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        controller.deleteGuest(
                                                            '${controller.guestByEventIdJson!.data![index].sId}');
                                                        //controller.getAllGuestsByEventId();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            print("deleted");
                                            //  controller.getAllGuestsByEventId();
                                            // Navigator.of(context).pop();
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ), // Icon(Icons.more_vert),
                                    isThreeLine: true,
                                  ),
                                  Divider(height: 0, color: AppColor.secondary),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),

      // New event button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.secondary,
        foregroundColor: Colors.white,
        // icon: Icon(Icons.add_outlined),
        label: Text('New Guest'),
        onPressed: () {
          Get.dialog(AlertDialog(
            title:
                Text("New Guest", style: TextStyle(color: AppColor.goldColor)),
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //guest name
                  CustomInputText(
                    controller: controller.guestNameConroller,
                    obscureText: false,
                    label: "Name:",
                  ),
                  //phone number
                  CustomInputText(
                    controller: controller.guestPhonenumberConroller,
                    obscureText: false,
                    label: "Phone Number:",
                  ),
                  //True or false boolean for the invitaion
                  /* CustomInputText(
                    controller: controller.guestInvitedConroller,
                    obscureText: false,
                    label: "",
                  ), */
                ],
              ),
            ),
            actions: <Widget>[
              GetBuilder<EventController>(
                builder: (controller) {
                  return TextButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.secondary, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.createGuests();
                      //controller.getAllGuestsByEventId();
                      Navigator.of(context).pop();
                      controller.guestNameConroller.clear();
                      controller.guestPhonenumberConroller.clear();
                    },
                  );
                },
              )
            ],
          ));
        },
      ),
    );
  }
}
