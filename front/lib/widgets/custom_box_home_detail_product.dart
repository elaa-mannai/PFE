import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/views/favorite_view.dart';
import 'package:get/get.dart';

class CustomBoxHomeDetailsProduct extends GetView<ProductsController> {
  final String? Descriptiontext, productname, ServiceName;
  final double? height;
  final double? width;
  final Function? function, FavoriteFunction;
  final double? widthBorder;
  final Color? colorBorder;
  final List<dynamic>? img;
  final IconData? icon;
  final dynamic Function()? fun;

  const CustomBoxHomeDetailsProduct(
      {Key? key,
      this.productname,
      this.Descriptiontext,
      this.ServiceName,
      this.fun,
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
    return FutureBuilder(
      future: fun!(), //controller.getProductById(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: AppColor.secondary,
          ); // or a loading indicator
        } else if (snapshot.hasError) {
          return Text('Something went wrong!');
        } else {
          print("data box producthome");
          // final List<dynamic> imagesList =
          img ?? [];

          print("object$img");
          //  print("testing list${controller.productGetByIdJson!.data!.images[index]}");
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
                    child: CarouselSlider(
                      items: buildImageSliders(img ?? []),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
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
                                  child: AutoSizeText(
                                      ServiceName ?? '$ServiceName',
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
