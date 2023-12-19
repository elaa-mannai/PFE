import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/views/guest-list.dart';
import 'package:front/widgets/custom_dropdown_list.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:get/get.dart';

class CustomEventDetails extends GetView<EventController> {
  final String? eventName;
  final String? datedeb, datefin, description, local, budget;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;
  const CustomEventDetails(
      {Key? key,
      this.eventName,
      this.datedeb,
      this.datefin,
      this.description,
      this.local,
      this.budget,
      this.function,
      this.widthBorder,
      this.colorBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //event title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                'Event Name: $eventName',
                presetFontSizes: [24, 18, 12],
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.goldColor,
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: AppColor.secondary),
                color: AppColor.secondary,
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'update',
                    child: Text('Update'),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'update') {
                    Get.dialog(AlertDialog(
                      title: Text("Update Event informations:",
                          style: TextStyle(color: AppColor.goldColor)),
                      backgroundColor: AppColor.white,
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            //event name
                            CustomInputText(
                              controller: controller.eventTitleController,
                              obscureText: false,
                              label: "Event Name:",
                            ),
                            //eventdesc
                            CustomInputText(
                              controller: controller.descriptionController,
                              obscureText: false,
                              label: "Event description: ",
                            ),
                            //budget
                            CustomInputText(
                              controller: controller.budgetController,
                              obscureText: false,
                              label: "Budget: ",
                            ),
                            //date range
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColor.secondary)),
                              child: Text('Pick event first and end date'),
                              onPressed: () {
                                controller.openRangeDatePicker(context);
                                // Text(" ${controller.dateDebutController.text}");
                              },
                            ),
                            //location
                            CustomDropdownList(),
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
                                    color: AppColor.secondary, fontSize: 20),
                              ),
                              onPressed: () {
                                print("object update");
                                controller.updateEvent();
                                //     '${controller.guestByEventIdJson!.data![index].sId}');
                                Get.to(GuestList());
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        )
                      ],
                    ));
                  } else if (value == 'delete') {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: AppColor.white,
                            title: Text("Do you want to delete this event?",
                                style: TextStyle(color: AppColor.goldColor)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No, Keep It!',
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent)),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.deleteEvent(
                                      '${controller.eventByIdJson!.data!.sId}');
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes, Delete It!',
                                    style:
                                        TextStyle(color: AppColor.secondary)),
                              ),
                            ],
                          );
                        });
                  }
                },
              )
            ],
          ),
          //date debut && date fin
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //description
                  AutoSizeText(
                    'Description: $description',
                    presetFontSizes: [20, 18, 12],
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  AutoSizeText(
                      "Date dedut: ${controller.formattedate("$datedeb")}",
                      presetFontSizes: [20, 18, 12],
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 18, color: AppColor.blackColor)),
                  AutoSizeText(
                      "Date fin: ${controller.formattedate("$datefin")}",
                      presetFontSizes: [20, 18, 12],
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 18, color: AppColor.blackColor)),
                  //local
                  AutoSizeText(
                    'Loactaion: $local',
                    presetFontSizes: [20, 18, 12],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  //budget
                  AutoSizeText(
                    'Budget: $budget',
                    presetFontSizes: [20, 18, 12],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
