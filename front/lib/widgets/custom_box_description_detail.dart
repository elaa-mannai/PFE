import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class CustomBoxDescriptionDetail extends GetView<ProductsController> {
  const CustomBoxDescriptionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          text: "Categorie: ",
        ),
        Text(
          "${controller.productGetByIdJson!.data!.category!.name}",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        CustomText(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          text: "Description",
        ),
        Text(
          "${controller.productGetByIdJson!.data!.description}",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ],
    );
  }
}
