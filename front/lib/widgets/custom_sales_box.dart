import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';

class CustomSalesBox extends StatelessWidget {
  final String text1;
  final String text2;
  final String money;

  const CustomSalesBox(
      {Key? key, required this.text1, required this.text2, required this.money})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.goldColor.withOpacity(0.1),
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignOutside,
            width: 0.1,
          color: AppColor.secondary,
          ),
          shape: BoxShape.rectangle,
        ),
        padding: EdgeInsets.all(25),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                text: '$text1',
              ),
              CustomText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                text: '$money DT',
              ),
              CustomText(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                text: '$text2',
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
