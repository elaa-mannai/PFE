import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/views/favorite_view.dart';
import 'package:get/get.dart';

class CustomFavoriteList extends StatelessWidget {
  final String? Descriptiontext,productname, ServiceName;
  final double? height;
  final double? width;
  final Function? function, FavoriteFunction;
  final double? widthBorder;
  final Color? colorBorder;
  final String? img;
  final IconData? icon;

  const CustomFavoriteList(
      {Key? key,
      this.productname,
      this.Descriptiontext,
      this.ServiceName,
      this.function,
      this.height,
      this.width,
      this.widthBorder,
      this.colorBorder,
      this.img,
      this.icon,
      this.FavoriteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: colorBorder!, width: widthBorder!),
        ),
        child: Column(
          children: [
            //image from base

            Expanded(
              flex: 3,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(80),
                  image: DecorationImage(
                    image: AssetImage('$img'),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                width: 200,
                //  width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.all(10),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(),
                    color: AppColor.goldColor.withOpacity(0.1)),
                child: Column(
                  children: [
                    //service name && fav icon
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          //service name
                          Expanded(
                            flex: 3,
                            child: AutoSizeText(ServiceName ?? '$ServiceName',
                                presetFontSizes: [20, 18, 12],
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                          // fav icon
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                print(
                                    '******************favorite******************');
                                FavoriteFunction!();
                                // saveProductIdInUserId();
                                //Get.to(FavoriteView());
                              },
                              icon: Icon(
                                icon,
                                color: AppColor.goldColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //name product
                    Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        '$productname',
                        presetFontSizes: [18, 12],
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    // description product
                    Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        '$Descriptiontext',
                        presetFontSizes: [18, 12],
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
