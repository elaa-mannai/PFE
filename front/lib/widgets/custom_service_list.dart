import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';

class CustomServiceList extends StatelessWidget {
  final String? product, price, Vname, Vnumber;
  final dynamic Function()? fun;
  final List<dynamic>? img;

  const CustomServiceList(
      {Key? key,
      this.product,
      this.price,
      this.Vname,
      this.Vnumber,
      this.fun,
      this.img})
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

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.goldColor.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(18)),
                border: Border.all(color: AppColor.goldColor, width: 1),
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
                      // width: 200,
                       width: MediaQuery.sizeOf(context).width,
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
                                  child: AutoSizeText('$product',
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
                                      // FavoriteFunction!();
                                      // saveProductIdInUserId();
                                      //Get.to(FavoriteView());
                                    },
                                    icon: Icon(
                                      Icons.abc,
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
                              '$price',
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
                              '$Vname',
                              presetFontSizes: [18, 12],
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: AutoSizeText(
                              '$Vnumber',
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
                            style: TextStyle(
                              color: AppColor.white ,
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
