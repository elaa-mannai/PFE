import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

class CustomChechbox extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;

  const CustomChechbox(
      {Key? key,
      this.text,
      this.function,
      this.height,
      this.width,
      this.widthBorder,
      this.colorBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: colorBorder!, width: widthBorder!),
          ),
          //fixedSize: Size(width!, height!),
          backgroundColor: AppColor.white.withOpacity(0.8), // background
          onPrimary: AppColor.goldColor, // foreground
        ),
        onPressed: () {
          function!();
        },
        child: Expanded(
            flex: 1,
            child: Text(
              '$text',
              style: TextStyle(fontSize: 18),
            )),
      ),
    );
  }
}
