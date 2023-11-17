import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Function? function;

  const CustomButton(
      {Key? key, this.text, this.backgroundColor, this.height, this.width, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width!, height!),
          backgroundColor: backgroundColor,//AppColor.goldColor, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          function!();
        },
        child: Text('$text',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
      ),
    );
  }
}
