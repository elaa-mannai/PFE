import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/views/guest-list.dart';
import 'package:front/views/service_check_view.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class CustomEventList extends GetView<EventController> {
  final String? eventName;
  final String? datedeb, datefin, description, local, budget, text;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;
  final Widget? getlistguest;

  CustomEventList({
    Key? key,
    this.eventName,
    this.text,
    this.function,
    this.widthBorder,
    this.colorBorder,
    this.datedeb,
    this.datefin,
    this.description,
    this.local,
    this.budget,
    this.getlistguest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   ScrollController scrollController = ScrollController();

    controller.getAllGuestsByEventId;

    return Padding(
      padding: EdgeInsets.fromLTRB(2, 15, 2, 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: colorBorder!, width: widthBorder!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //event title
                AutoSizeText(
                  'Event Name: $eventName',
                  presetFontSizes: [24, 18, 12],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                  ),
                ),
                //description
                AutoSizeText(
                  'Description: $description',
                  presetFontSizes: [22, 18, 11],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                //date debut && date fin
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          //datedebut
                          AutoSizeText(
                            controller.formattedate("$datedeb"),
                            presetFontSizes: [18, 12, 10],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18, color: AppColor.blackColor),
                          ),
                          //datefin
                          AutoSizeText(
                            controller.formattedate("$datefin"),
                            presetFontSizes: [18, 12, 10],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18, color: AppColor.blackColor),
                          ),
                          //local
                          AutoSizeText(
                            'Loactaion: $local',
                            presetFontSizes: [12, 10],
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          //budget
                          AutoSizeText(
                            'Budget: $budget',
                            presetFontSizes: [18, 12, 10],
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          CustomText(text: "Pack of services:"),
                          // services data which are related to each event
                          TextButton(
                            onPressed: () {
                              Get.to(ServiceCheckView());

                              ///// update the added services in the other interface 
                            },
                            child: FlutterImageStack(
                              showTotalCount: true,
                              ////// get services data /////////
                              imageList: _images,
                              totalCount: 10,
                              itemRadius: 40,
                              itemCount: 1,
                              itemBorderWidth: 1,
                              extraCountTextStyle:
                                  TextStyle(color: Colors.white),
                              itemBorderColor: AppColor.secondary,
                              backgroundColor: AppColor.secondary,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),

                    ////////////////////////////////////////////////////////////
                    ///problem that it only get one event by id

                    Column(
                      children: [
                        CustomText(text: "Guest List:"),
                        Text(
                          text!,
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
                /////// guest list
                ///
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////
List<String> _images = [
  'https://images.unsplash.com/photo-1590650516494-0c8e4a4dd67e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80',
];
List<String> _imagesGuest = [
  'https://images.unsplash.com/photo-1632067694887-097be1c5c5d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
];
/* import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
import 'package:front/views/vendors/test_View.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class CustomEventList extends GetView<EventController> {
  final String? eventName;
  final String? datedeb, datefin, description, local, budget;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;

  CustomEventList({
    Key? key,
    this.eventName,
    this.function,
    this.widthBorder,
    this.colorBorder,
    this.datedeb,
    this.datefin,
    this.description,
    this.local,
    this.budget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Padding(
      padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: colorBorder!, width: widthBorder!),
        ),
        child: Row(
          children: [
            SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(18), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(80), // Image radius
                child: Image(
                    image: AssetImage("assets/images/landpage.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //event title
                AutoSizeText(
                  '$eventName',
                  presetFontSizes: [24, 18, 12],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.goldColor,
                  ),
                ),
                //date debut && date fin
                AutoSizeText(controller.formattedate("$datedeb"),
                    presetFontSizes: [18, 12, 10],
                    maxLines: 1,
                    style: TextStyle(fontSize: 18, color: AppColor.blackColor)),
                AutoSizeText(controller.formattedate("$datefin"),
                    presetFontSizes: [18, 12, 10],
                    maxLines: 1,
                    style: TextStyle(fontSize: 18, color: AppColor.blackColor)),
                //local
                AutoSizeText(
                  '$local',
                  presetFontSizes: [12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                //budget
                AutoSizeText(
                  ' $budget',
                  presetFontSizes: [18, 12, 10],
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.secondary,
                  ),
                ),
                CustomText(text: "Pack of services:"),
                // services data which are related to each event
                TextButton(
                  onPressed: () {
                   // Get.to(TestView());
                  },
                  child: FlutterImageStack(
                    showTotalCount: true,
                    ////// get services data /////////
                    imageList: _images,
                    totalCount: _images.length,
                    itemRadius: 40,
                    itemCount: 5,
                    itemBorderWidth: 1,
                    itemBorderColor: AppColor.secondary,
                    backgroundColor: AppColor.secondary,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _images = [
  'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
      'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
];
 */
