import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/state_manager.dart';

class CustumSalesServices extends GetView {
  final String customername;
  final Color? color;
  final String productname;
  final String status;
  final Function function;
  final IconData? icon;

  const CustumSalesServices(
      {Key? key,
      this.icon,
      this.color,
      required this.customername,
      required this.productname,
      required this.status,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // customer name
        Expanded(
          child: CustomText(
              fontSize: 16, fontWeight: FontWeight.w300, text: productname!),
        ),
        // SizedBox(width: 20),
        /// product name
        Expanded(
          child: CustomText(
              fontSize: 16, fontWeight: FontWeight.w300, text: customername!),
        ),
        //  SizedBox(width: 30),
        Expanded(
          child: CustomText(
              fontSize: 16, fontWeight: FontWeight.w300, text: status!),
        ),
        //SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(10, 10),
                backgroundColor: color!, // background
                onPrimary: AppColor.white , // foreground
              ),
              onPressed: () {
                function();
              },
              child: Icon(icon!)),
        ),
      ],
    );
  }
}
