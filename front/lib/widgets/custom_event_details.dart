import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/event_contorller.dart';
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
       child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: colorBorder!, width: widthBorder!),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          //date debut && date fin
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: [
                  AutoSizeText("Date dedut: ${controller.formattedate("$datedeb")}",
              presetFontSizes: [20, 18, 12],
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18, color: AppColor.blackColor)),
                  AutoSizeText("Date fin: ${controller.formattedate("$datefin")}",
              presetFontSizes: [20, 18, 12],
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18, color: AppColor.blackColor)),
                  //local
                  AutoSizeText(
                    'Loactaion: $local',
              presetFontSizes: [20, 18, 12],
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  //budget
                  AutoSizeText(
                    'Budget: $budget',
              presetFontSizes: [20, 18, 12],
                    maxLines: 2,
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
    ),);
  }
}
