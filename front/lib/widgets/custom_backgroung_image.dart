import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

class CustomBackgroungImage extends StatelessWidget {
  final Widget widget;
  final String image;
  final BoxFit fit;
  const CustomBackgroungImage(
      {Key? key, required this.widget, required this.image, required this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Image.asset(image,
            //'assets/images/landpage.jpg',
            fit: fit),
        /*   decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/landpage.jpg'),
            fit: BoxFit.cover,
          ), 
        ),*/
      ),
      Expanded(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.all(10),
          color: AppColor.white.withOpacity(0.9),
          child: widget,
        ),
      )
    ]);
  }
}
