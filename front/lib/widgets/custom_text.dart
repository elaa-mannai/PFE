import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:front/config/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CustomText(
      {Key? key, this.text, this.fontSize, this.fontWeight, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:/*  AutoSizeText(
        text!,
        presetFontSizes: [24, 18, 16, 12, 11, 8, ],
        maxLines: 22,
        softWrap: true,
        textAlign: textAlign,
        style: TextStyle(
          color: AppColor.goldColor,
          fontFamily: 'Inter',
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ), */
      Text(
        text!,
        // maxLines: ,
        style: TextStyle(
          color: AppColor.goldColor,
          fontFamily: 'Inter',
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
