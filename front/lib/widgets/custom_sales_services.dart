import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/state_manager.dart';

class CustumSalesServices extends GetView {
  final String customername;
  final String text;
  final String productname;
  final String status;
  final Function function;

  const CustumSalesServices(
      {Key? key,
      required this.customername,
      required this.text,
      required this.productname,
      required this.status,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Row(
        children: [
          // customer name
          Expanded(flex: 2,child: CustomText(fontSize: 18, fontWeight: FontWeight.w300, text: productname),),
          // SizedBox(width: 20),
          /// product name
          Expanded(
            child: CustomText(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                text: customername),
          ),
        //  SizedBox(width: 30),
          Expanded(
            child: CustomText(
                fontSize: 18, fontWeight: FontWeight.w300, text: '$status '),
          ),
          //SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(10, 10),
                backgroundColor: AppColor.goldColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                function();
              },
              child: Icon(Icons.arrow_right_rounded)!,
            ),
          ),
        ],
      ),
    );
  }
}
