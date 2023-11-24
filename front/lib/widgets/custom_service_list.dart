import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

class CustomServiceList extends StatelessWidget {
  final String? product, price, Vname, Vnumber;
  const CustomServiceList({Key? key, this.product, this.price, this.Vname, this.Vnumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Product name
                  AutoSizeText(
                    'Product: $product',
                    presetFontSizes: [18, 16, 12],
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  // Product price
                  AutoSizeText(
                    'Price: $price',
                    presetFontSizes: [18, 16, 12],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  // Vendor name
                  AutoSizeText(
                    ' $Vname',
                    presetFontSizes: [18, 16, 12],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.secondary,
                    ),
                  ),
                  // Vendor Phone number
                  AutoSizeText(
                    'Phone: $Vnumber',
                    presetFontSizes: [18, 16, 12],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
