import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:get/get.dart';

class CustomProductListV extends GetView<ProductsController> {
  final String? productName, categorie;
  final String? description, local, price;
  final Function? function;
  final double? widthBorder;
  final Color? colorBorder;

  CustomProductListV({
    Key? key,
    this.productName,
    this.categorie,
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
          return CircularProgressIndicator(); // or a loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<dynamic> imagesList =
              controller.productGetByIdJson?.data?.images ?? [];
          print("testing list${controller.productGetByIdJson!.data!.images}");
          print("testing data${controller.productGetByIdJson!.data!}");

          return Padding(
            padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(24)),
                border: Border.all(
                    color: colorBorder!.withOpacity(0.1), width: widthBorder!),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CarouselSlider(
                      items: buildImageSliders(imagesList),
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
                  Expanded(
                    child: Icon(
                      Icons.more_vert,
                      color: AppColor.secondary,
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

  List<Widget> buildImageSliders(List<dynamic> imagesList) {
    return imagesList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.toString(),
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            '${imagesList.indexOf(item)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
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
