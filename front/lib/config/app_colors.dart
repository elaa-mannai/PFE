import 'package:flutter/material.dart';

class AppColor {
  static Color blackColor = Colors.black87;
  static Color white = HexColor("#f8f7f4");
  static Color redText = HexColor("#7A1A1A");
  static Color buttonColor = HexColor("#94E044");
  static Color bleucolor = HexColor("#79d2e6");
  static const goldColor = Color.fromARGB(177, 129, 102, 9);
  static const secondary = Color.fromARGB(176, 201, 167, 43);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
