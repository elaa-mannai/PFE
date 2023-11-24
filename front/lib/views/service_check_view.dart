import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custum_event_list.dart';

class ServiceCheckView extends StatelessWidget {
const ServiceCheckView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return CustomEventList(
      budget: "test",
      colorBorder: AppColor.secondary,
      datedeb: "2023-12-22T23:00:00.000Z",
      datefin: "2023-12-22T23:00:00.000Z",
      description: "test",
      eventName: "test",
      text: "text",
      function: (){},
      local: "test",
      widthBorder: 1,
    );
  }
}