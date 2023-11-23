import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

import 'custom_text.dart';

class CustomButtonText extends StatelessWidget {
  final String? text;
  final double? fontsize;
  final FontWeight? fontsizeweight;
  final Function? function;
  final IconData? icon;
  const CustomButtonText(
      {Key? key, this.text, this.function, this.icon, this.fontsize, this.fontsizeweight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: CustomText(
            textAlign: TextAlign.center,
            text: '$text',
            fontSize: fontsize,
            fontWeight: fontsizeweight,
          ),
          onTap: () {
            function!();
          },
        ),
        IconButton(
          icon: Icon(
            icon,
            color: AppColor.goldColor,
          ),
          onPressed: () {
            function!();
          },
        ),
      ],
    );
  }
}
