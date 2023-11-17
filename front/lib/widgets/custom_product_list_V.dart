import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
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
    // ScrollController scrollController = ScrollController();

    return Padding(
      padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),

          border: Border.all(color: colorBorder!.withOpacity(0.2), width: widthBorder!),
        ),
        child: Row(
          children: [
            // SizedBox(width: 5),
             Expanded(
              flex: 2,
              child:
               CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.5,
                          enlargeCenterPage: true,
                        ),
                      ),
              /*  ClipRRect(
                borderRadius: BorderRadius.circular(18), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(80), // Image radius
                  child: Image(
                      image: AssetImage("assets/images/landpage.jpg"),
                      fit: BoxFit.cover),
                ),
              ), */
            ), 
            SizedBox(width: 15),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //product title
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
                  //local
                  AutoSizeText(
                    '$local',
                    presetFontSizes: [16, 12],
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  //budget
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
            // SizedBox(width: 5),
            Expanded(child: Icon(Icons.more_vert, color: AppColor.secondary,))
          ],
        ),
      ),
    );
  }
}




final List<String> imgList = ["${NetworkImage("${AccountInfoStorage.readProductListImage()}" )}"];


final List<Widget>  imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${imgList.indexOf(item)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
    