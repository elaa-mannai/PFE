import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/vendors/service_details.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class CustomProductListV extends GetView<ProductsController> {
  final String? productName, categorie;
  final String? description, local, price;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;
  final List<dynamic>? img;

  CustomProductListV({
    Key? key,
    this.productName,
    this.categorie,
    this.img,
    this.price,
    this.function,
    this.widthBorder,
    this.colorBorder,
    this.description,
    this.local,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getProductById(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: AppColor.secondary,
          ); // or a loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          img ?? [];

          return Padding(
            padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                // border: Border.all(
                //     color: colorBorder!.withOpacity(0.1), width: widthBorder!),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CarouselSlider(
                      items: buildImageSliders(img ?? [], context),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '$productName',
                          overflow: TextOverflow.ellipsis,
                          presetFontSizes: [18, 12],
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.goldColor,
                          ),
                        ),
                        AutoSizeText(
                          '$description',
                          presetFontSizes: [18, 12],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.goldColor,
                          ),
                        ),
                        AutoSizeText(
                          '$local',
                          presetFontSizes: [16, 12],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        AutoSizeText(
                          '$price',
                          presetFontSizes: [16, 12],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.blackColor,
                          ),
                        ),
                        AutoSizeText(
                          '$categorie',
                          presetFontSizes: [16, 12],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.secondary,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  List<Widget> buildImageSliders(
      List<dynamic> imagesList, BuildContext context) {
    return imagesList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item.toString(),
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: MediaQuery.sizeOf(context).height,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(0, 255, 255, 255)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
  }
}
