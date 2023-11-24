import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_service_list.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:front/widgets/custum_event_list.dart';

class ServiceCheckView extends StatelessWidget {
  const ServiceCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, //your color
          surfaceTintColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.goldColor,
                size: 40,
              )),
          title: CustomText(
            fontSize: 16,
            text: 'Pack of services',
          ),
        ),
        body: SingleChildScrollView(
            child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: CustomServiceList(
            Vname: 'test',
            Vnumber: 'test',
            price: 'test',
            product: 'test',
          ),
        )));
  }
}
